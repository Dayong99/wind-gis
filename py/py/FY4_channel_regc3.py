
import sys

from PIL import Image, ImageEnhance
import netCDF4 as nc
import numpy as np

import projection

import warnings

warnings.filterwarnings("ignore")

line, column = None, None

channel_one = None
channel_two = None

max_len = None


channels = {'0500M': ('Channel02',),
            '1000M': ('Channel01', 'Channel02', 'Channel03'),
            '2000M': tuple([f'Channel{x:02d}' for x in range(1, 8)]),
            '4000M': tuple([f'Channel{x:02d}' for x in range(1, 15)])}


from projection import latlon2linecolumn

# 各分辨率行列数
SIZES = {'0500M': 21984,
         '1000M': 10992,
         '2000M': 5496,
         '4000M': 2748}


class FY4A_AGRI_L1(object):
    """
    FY4A（AGRI一级数据）类
    """
    def __init__(self, l1name):
        """
        获得L1数据hdf5文件对象、记录读取状态
        """
        self.dataset = nc.Dataset(l1name, 'r')
        self.resolution = l1name[-15:-10]
        self.channels = {x: None for x in channels[self.resolution]}
        self.line_begin = self.dataset.getncattr('Begin Line Number')
        self.line_end = self.dataset.getncattr('End Line Number')
        # geo_range与line和column同步并对应
        self.geo_range = None
        self.line = None
        self.column = None

    def __del__(self):
        """
        确保关闭L1数据hdf5文件
        """
        self.dataset.close()
        

    def extract(self, channelname, geo_range=None):
        """
        最邻近插值提取
        line：行号
        column：列号
        channelname：要提取的通道名（如'Channel01'）
        返回字典
        暂时没有处理缺测值（异常）
        REGC超出范围未解决
        """
        NOMChannelname = 'NOM' + channelname
        CALChannelname = 'CAL' + channelname
        # 若geo_range没有指定，则读取整幅图像，不定标
        if geo_range is None:
            channel = self.dataset[NOMChannelname][()]
            self.channels[channelname] = channel
            return None
        geo_range = eval(geo_range)
        if self.geo_range != geo_range:
            self.geo_range = geo_range
            # 先乘1000取整是为了防止浮点数的精度误差累积
            lat_S, lat_N, lon_W, lon_E, step = \
                [int(1000 * x) for x in geo_range]
            lat = np.arange(lat_N, lat_S-1, -step) / 1000
            lon = np.arange(lon_W, lon_E+1, step) / 1000
            lon_mesh, lat_mesh = np.meshgrid(lon, lat)
            # 求geo_range对应的标称全圆盘行列号
            line, column = \
                latlon2linecolumn(lat_mesh, lon_mesh, self.resolution)
            self.line = np.rint(line).astype(np.uint16) - self.line_begin
            self.column = np.rint(column).astype(np.uint16)
        # DISK全圆盘数据和REGC中国区域数据区别在起始行号和终止行号
        channel = \
            self.dataset[NOMChannelname][()][self.line, self.column]
        # 定标表
        CALChannel = self.dataset[CALChannelname][()].astype(np.float32)
        CALChannel = np.append(CALChannel, np.nan)
        channel[channel >= 65534] = 4096

        self.channels[channelname] = CALChannel[channel]




def loader(file_name):
    return FY4A_AGRI_L1(file_name)


def file_path_to_name(file_path: str):
    cache = file_path.replace("\\", "/")
    cache = cache[cache.rfind("/") + 1:]
    return cache


def get_resolution(file_name: str):
    cache = file_path_to_name(file_name)
    caches = cache.split("_")
    return caches[-2]


def data_to_image(data_set, resolution, input_name: str, geo_range: list):
    global channel_one
    global channel_two
    count = 0
    if resolution not in channels.keys():
        return
    ch = channels[resolution]
    cache = "{},{},{},{},{}".format(geo_range[0], geo_range[1], geo_range[2], geo_range[3], geo_range[4])
    geo_range = cache #'10, 54, 50, 160, 0.04'
    for i in ch:
        print("generate {}...".format(i))
        data_set.extract(i,geo_range)
        data = data_set.channels[i]
        data[np.isnan(data)]=0
        

            
        Imax = np.max(data)
        Imin = np.min(data)
        output = (data - Imin) / (Imax - Imin) * (255 - 0) + 0
        if count>6:
            temps = output.copy()
            temps[::] = 255
            output = temps-output

        img = Image.fromarray(output)
        img = img.convert("L")
        if count>5:
            enh_bri = ImageEnhance.Brightness(img)
            image_brightness = enh_bri.enhance(2.5)
        else :
            enh_bri = ImageEnhance.Brightness(img)
            image_brightness = enh_bri.enhance(1)
        enh_con = ImageEnhance.Contrast(image_brightness)
        image = enh_con.enhance(1.5)
        if "Channel01" == i:
            channel_one = np.array(img)
#             print(channel_one.shape)
        elif "Channel02" == i:
            channel_two = np.array(img)
        image = image.resize(projection.get_column_from_line(img.height, img.width, max_len))
        img_name = "{}Channel{}_{}.JPG".format(
            input_name, int(i[7:]), "1" if resolution == "1000M" else "2" if resolution == "2000M" else "4"
        )
        image.save(img_name)
        image.close()
        count+=1


def channel_to_color(save_name):
    print("generate true_color...")
    img_r = channel_two[:, :]
    img_g = channel_one[:, :]
    img_b = img_g.copy()

    img = np.dstack((img_r, img_g, img_b))
    img = img.astype(np.uint8)
    image = Image.fromarray(img, "RGB")
    image = image.resize(projection.get_column_from_line(image.height, image.width, max_len))
    image.save(save_name)
    image.close()


if __name__ == '__main__':
    try:

        if len(sys.argv) != 8:
            print("参数数量应该为7个，当前数量{}个".format(len(sys.argv) - 1), file=sys.stderr)
            sys.exit(0)
        south = float(sys.argv[1])
        north = float(sys.argv[2])
        west = float(sys.argv[3])
        east = float(sys.argv[4])
        file_name = sys.argv[5]
        out_name = sys.argv[6]
        max_len = int(sys.argv[7])


        data = loader(file_name)
        resolution = get_resolution(file_name)
        data_to_image(data, resolution, out_name,
                      [south, north, west, east,
                       0.01 if resolution == "1000M" else 0.02 if resolution == "2000M" else 0.04])
        name = "{}{}_{}.JPG".format(out_name, "true_colors",
                                    1 if resolution == "1000M" else 2 if resolution == "2000M" else 4)
        channel_to_color(name)
#         data.close()
        print("Success")
    except Exception as e:
        import traceback

        traceback.print_exc()
        print("Failed")

# python FY4_channel_regc.py 3 55 60 137 E:\new\2020_fy4a\FY4A_data\AGRI\REGC\105336\FY4A-_AGRI--_N_REGC_1047E_L1-_FDI-_MULT_NOM_20200527105336_20200527105753_1000M_V0001.HDF ./ 2748

