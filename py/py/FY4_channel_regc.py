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

# def loader(file_name):
#     fs = find_files_and_readers(file_name)
#     scn = Scene(sensor='ahi', filenames=fs)
#     channel_names = scn.available_dataset_names()
#     for channel in channel_names[0:14]:
#         scn.load([channel])
#     keys = scn.keys()
#     for k in keys:
#         scn.show(k)
#     return scn


channels = {
    "1000M": ["01", "02", "03"],
    "2000M": ["01", "02", "03", "04", "05", "06", "07"],
    "4000M": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14"]
}


def loader(file_name):
    return nc.Dataset(file_name)


def file_path_to_name(file_path: str):
    cache = file_path.replace("\\", "/")
    cache = cache[cache.rfind("/") + 1:]
    return cache


def get_resolution(file_name: str):
    cache = file_path_to_name(file_name)
    caches = cache.split("_")
    return caches[-2]


def data_to_image(data_set, resolution, input_name: str, geo_range: list):
    if resolution not in channels.keys():
        return
    ch = channels[resolution]
    global line, column, channel_one, channel_two
    line, column = projection.getlinecolum(geo_range, resolution)
    d_k = 104
    if resolution == "1000M":
        d_k = 416
    if resolution == "2000M":
        d_k = 208
    line = line - d_k
    for i in ch:
        print("generate NOMChannel{}...".format(i))
        cache_d = data_set.variables["NOMChannel{}".format(i)]
        d = np.array(cache_d)
        d = projection.calc(d)
        line_len = 10992 if resolution == "1000M" else 5496 if resolution == "2000M" else 2748
        # 灰度图转RGB图
        data00 = np.zeros((line_len, line_len))
        data00[data00 == 0] = np.nan
        m = d.shape[0]
        # p = 74 * (2 if resolution == "2000M" else 4 if resolution == "1000M" else 1)
        p = 74
        if resolution == "1000M":
            p = 296
        elif resolution == "2000M":
            p = 148
        elif resolution == "4000M":
            p = 74
        data00[p:(p + m), :] = d  # 1000M 19  2000M 630 4481 4000M 74
        nanId = np.where((data00 >= 255) | (data00 == 0) | np.isnan(data00))
        a = np.zeros((data00.shape[0], data00.shape[1]), dtype=np.uint8)
        a[::] = 255
        img = np.dstack((data00.copy(), data00.copy(), data00.copy(), a))
        img = img.astype(np.uint8)
        img[nanId] = [0, 0, 0, 0]

        img = img[line, column]
        image = Image.fromarray(img, "RGBA")
        if "01" == i:
            channel_one = np.array(img)
        elif "02" == i:
            channel_two = np.array(img)
        enh_bri = ImageEnhance.Brightness(image)
        image_brightness = enh_bri.enhance(1.4)
        # 对比度增强
        enh_con = ImageEnhance.Contrast(image_brightness)
        image = enh_con.enhance(1.25)
        img_name = "{}Channel{}_{}.PNG".format(
            input_name, int(i), "1" if resolution == "1000M" else "2" if resolution == "2000M" else "4"
        )
        image = image.resize(projection.get_column_from_line(image.height, image.width, max_len))
        image.save(img_name)
        image.close()


def channel_to_color(save_name):
    print("generate true_color...")
    img_r = channel_two[:, :, 0]
    img_g = channel_one[:, :, 0]
    img_b = img_g.copy()
    a = np.zeros((img_r.shape[0], img_r.shape[1]), dtype=np.uint8)
    a[::] = 255
    img = np.dstack((img_r, img_g, img_b, a))
    img = img.astype(np.uint8)
    image = Image.fromarray(img, "RGBA")
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
        name = "{}{}_{}.PNG".format(out_name, "true_color",
                                    1 if resolution == "1000M" else 2 if resolution == "2000M" else 4)
        channel_to_color(name)
        data.close()
        print("Success")
    except Exception as e:
        import traceback

        traceback.print_exc()
        print("Failed")

# python FY4_channel_regc.py 3 55 60 137 E:\new\2020_fy4a\FY4A_data\AGRI\REGC\105336\FY4A-_AGRI--_N_REGC_1047E_L1-_FDI-_MULT_NOM_20200527105336_20200527105753_1000M_V0001.HDF ./ 2748
