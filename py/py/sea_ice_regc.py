import sys

import netCDF4 as nc
import numpy as np
from PIL import Image

import projection

import warnings
warnings.filterwarnings("ignore")

# channel_color = {
#     0.0: (0xff, 0xff, 0xff, 0x00,), -2.0: (0xE1, 0xED, 0xFC, 0xFF,), -4.0: (0xCE, 0xE1, 0xF9, 0xFF,),
#     -6.0: (0xBC, 0xD7, 0xF7, 0xFF,), -8.0: (0xAC, 0xCD, 0xF5, 0xFF,), -10.0: (0x9A, 0xC2, 0xF3, 0xFF,),
#     -12.0: (0x8A, 0xB8, 0xF1, 0xFF,), -14.0: (0x7A, 0xAE, 0xEF, 0xFF,), -16.0: (0x67, 0xA3, 0xEC, 0xFF,),
#     -18.0: (0x56, 0x98, 0xEA, 0xFF,), -20.0: (0x46, 0x8F, 0xE8, 0xFF,), -22.0: (0x36, 0x85, 0xE7, 0x55,),
#     -24.0: (0x26, 0x7B, 0xE4, 0xFF,), -26.0: (0x12, 0x6F, 0xE2, 0xFF,), -28.0: (0x01, 0x65, 0xDF, 0xFF,)
# }

channel_color = {-2: (0x05, 0x05, 0xc8, 255,)}

max_len = None


def loader(file_name):
    return nc.Dataset(file_name)


def color_mapping(data: np.ndarray):
    # 灰度图转RGB图

    if data is None:
        return

    data00 = np.zeros((2748, 2748))
    data00[data00 == 0] = 'NAN'
    m = data.shape[0]
    data00[70:(70 + m), :] = data
    nanId = np.where((data00 >= 255) | (data00 == 0) | np.isnan(data00))
    # data = np.int8(data00)
    data = data00

    r = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    g = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    b = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    a = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)

    r[np.less_equal(data[::], -2)] = channel_color[-2][0]
    g[np.less_equal(data[::], -2)] = channel_color[-2][1]
    b[np.less_equal(data[::], -2)] = channel_color[-2][2]
    a[np.less_equal(data[::], -2)] = channel_color[-2][3]

    a[np.less(data[::], -50)] = 0
    a[np.greater(data[::], 50)] = 0

    img = np.dstack([r, g, b, a])
    img[nanId] = [0, 0, 0, 0]
    return img


def array_to_image(data: np.ndarray, save_path):
    image = Image.fromarray(data, "RGBA")
    image = image.resize(projection.get_column_from_line(data.shape[0], data.shape[1], max_len), Image.ANTIALIAS)
    image.save(save_path)
    image.close()


def file_path_to_name(file_path: str):
    cache = file_path.replace("\\", "/")
    cache = cache[cache.rfind("/") + 1:]
    return cache


def get_resolution(file_name: str):
    cache = file_path_to_name(file_name)
    caches = cache.split("_")
    return caches[-2]


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
        out_path = sys.argv[6]
        max_len = int(sys.argv[7])

        # south = -54.96
        # north = 54.96
        # west = 49.74
        # east = 159.66
        # file_name = r"E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.NC"
        # out_path = r"E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.PNG"

        data_set = loader(file_name)
        data = data_set.variables["SST"]
        data = np.asarray(data)
        resolution = get_resolution(file_name)
        geo_range = [south, north, west, east,
                     0.01 if resolution == "1000M" else 0.02 if resolution == "2000M" else 0.04]
        line, column = projection.getlinecolum(geo_range, resolution)
        line = line - 104
        data = data[line, column]
        data = color_mapping(data)

        array_to_image(data, out_path)
        print("Success")
    except:
        import traceback
        traceback.print_exc()
        print("Failed")

# python sea_surface_temperature.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.NC E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.PNG
