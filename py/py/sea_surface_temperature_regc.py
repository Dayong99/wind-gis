import sys

import netCDF4 as nc
import numpy as np
from PIL import Image

import projection

import warnings

warnings.filterwarnings("ignore")

# channel_color = {
#     -2.0: (1, 0, 140, 255,), -1.0: (0, 0, 140, 255,), 0.0: (2, 0, 159, 255,), 1.0: (1, 0, 179, 255,),
#     2.0: (5, 0, 203, 255,),
#     3.0: (0, 8, 253, 255,), 4.0: (13, 13, 252, 255,), 5.0: (11, 55, 255, 255,), 6.0: (7, 83, 255, 255,),
#     7.0: (0, 117, 255, 255,),
#     8.0: (3, 137, 250, 255,), 9.0: (0, 185, 255, 255,), 10.0: (6, 215, 254, 255,), 11.0: (8, 235, 255, 255,),
#     12.0: (15, 254, 241, 255,), 13.0: (61, 254, 197, 255,), 14.0: (77, 254, 190, 255), 15.0: (113, 255, 146, 255,),
#     16.0: (141, 253, 115, 255,), 17.0: (175, 255, 91, 255,), 18.0: (202, 255, 58, 255,), 19.0: (232, 254, 26, 255,),
#     20.0: (254, 244, 1, 255,), 21.0: (250, 223, 6, 255,), 22.0: (254, 178, 0, 255,), 23.0: (253, 142, 4, 255,),
#     24.0: (255, 122, 0, 255,), 25.0: (253, 86, 1, 255,), 26.0: (254, 62, 1, 255,), 27.0: (252, 24, 0, 255,),
#     28.0: (251, 0, 0, 255,), 29.0: (206, 1, 4, 255,), 30.0: (188, 0, 6, 255,), 31.0: (142, 7, 13, 255,),
#     -888: (0, 0, 0, 0), 65530: (0, 0, 0, 0), 65532: (0, 0, 0, 0), 65535: (0, 0, 0, 0)
# }


channel_color = {
    -2.0: (0x04, 0x04, 0x6c, 255,), 2.0: (0x40, 0x40, 0x88, 255,), 6.0: (0x04, 0x04, 0xb0, 255,),
    10: (0x09, 0x0d, 0xea, 255,), 14.0: (0x36, 0x54, 0xfc, 255,), 18.0: (0x4c, 0x77, 0xfc, 255,),
    20.0: (0x54, 0x7c, 0xfc, 255,), 21.0: (0x7a, 0xb7, 0xf6, 255,), 22.0: (0xa5, 0xcd, 0xcc, 255),
    23.0: (0xb5, 0xc8, 0xaa, 255,), 24.0: (0xc4, 0xc4, 0x90, 255,), 25.0: (0xc4, 0xc4, 0x84, 255,),
    26.0: (0xd1, 0xbd, 0x72, 255,), 27.0: (0xf3, 0xa9, 0x2c, 255,), 28.0: (0xfc, 0x80, 0x14, 255,),
    29.0: (0xfc, 0x60, 0x0c, 255,), 30.0: (0xfc, 0x32, 0x04, 255,), 32.0: (0xef, 0x0a, 0x04, 255,),
    34.0: (0xc8, 0x04, 0x04, 255,), 36.0: (0xaf, 0x04, 0x04, 255,), 38.0: (0x94, 0x04, 0x04, 255),
    40.0: (0x78, 0x48, 0x44, 255,), -888: (0, 0, 0, 0), 65530: (0, 0, 0, 0), 65532: (0, 0, 0, 0), 65535: (0, 0, 0, 0)
}

max_len = None


def loader(file_name):
    return nc.Dataset(file_name)


def color_mapping(data: np.ndarray):
    if data is None:
        return

    data00 = np.zeros((data.shape[1], data.shape[1]))
    data00[data00 == 0] = 'NAN'
    m = data.shape[0]
    data00[70:(70 + m), :] = data
    nanId = np.where((data00 >= 255) | (data00 == 0) | np.isnan(data00))
    data = np.uint8(data00)

    r = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    g = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    b = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    a = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    a[::] = 255
    keys = list(channel_color.keys())
    keys.sort()
    for index in range(len(keys)):
        if index == len(keys) - 1:
            break
        if keys[index] == -888 or (keys[index] == 65535) or (keys[index] == 65530) or (keys[index] == 65532):
            r[np.where(np.equal(data[::], keys[index]))] = 0
            g[np.where(np.equal(data[::], keys[index]))] = 0
            b[np.where(np.equal(data[::], keys[index]))] = 0
            a[np.where(np.equal(data[::], keys[index]))] = 0
            continue
        r[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
            channel_color[keys[index]][0]
        g[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
            channel_color[keys[index]][1]
        b[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
            channel_color[keys[index]][2]
        a[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
            channel_color[keys[index]][3]
    r[np.where(np.less(data[::], min(keys)))] = channel_color[min(keys)][0]
    g[np.where(np.less(data[::], min(keys)))] = channel_color[min(keys)][1]
    b[np.where(np.less(data[::], min(keys)))] = channel_color[min(keys)][2]
    a[np.where(np.less(data[::], min(keys)))] = channel_color[min(keys)][3]

    r[np.where(np.greater_equal(data[::], max(keys)))] = channel_color[min(keys)][0]
    g[np.where(np.greater_equal(data[::], max(keys)))] = channel_color[min(keys)][1]
    b[np.where(np.greater_equal(data[::], max(keys)))] = channel_color[min(keys)][2]
    a[np.where(np.greater_equal(data[::], max(keys)))] = channel_color[min(keys)][3]

    r[np.where(np.greater(data[::], 50))] = 0
    g[np.where(np.greater(data[::], 50))] = 0
    b[np.where(np.greater(data[::], 50))] = 0
    a[np.where(np.greater(data[::], 50))] = 0

    r[np.where(np.less(data[::], -50))] = 0
    g[np.where(np.less(data[::], -50))] = 0
    b[np.where(np.less(data[::], -50))] = 0
    a[np.where(np.less(data[::], -50))] = 0

    img = np.dstack([r, g, b, a])
    img[nanId] = [0, 0, 0, 0]
    return img


def array_to_image(data: np.ndarray, save_path):
    image = Image.fromarray(data, "RGBA")
    image = image.resize((projection.get_column_from_line(data.shape[0], data.shape[1], max_len)), Image.ANTIALIAS)
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

# python sea_surface_temperature.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.NC E:\new\2020_fy4a\FY4A_data\product_NC202005270400\SST\DISK\20200527\010000\FY4A-_AGRI--_N_DISK_1047E_L2-_SST-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.PNG 1024
