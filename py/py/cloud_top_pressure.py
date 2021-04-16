import sys

import netCDF4 as nc
import numpy as np
from PIL import Image

import projection

import warnings
warnings.filterwarnings("ignore")

channel_color = {
    1.0: (24, 0, 255, 255,), 51.0: (0, 45, 255, 255,), 101.0: (0, 106, 255, 255,),
    151.0: (0, 177, 255, 255,), 221.0: (0, 233, 255, 255,), 271.0: (0, 255, 198, 255,),
    321.0: (0, 255, 126, 255,), 441.0: (0, 255, 55, 255,), 491.0: (20, 255, 0, 255,),
    541.0: (93, 255, 0, 255,), 591.0: (131, 255, 0, 255,), 661.0: (164, 255, 0, 255,),
    711.0: (202, 255, 0, 255,), 761.0: (246, 255, 0, 255,), 811.0: (255, 233, 0, 255,),
    861.0: (255, 190, 0, 255,), 911.0: (255, 160, 0, 255,), 961.0: (255, 119, 0, 255,),
    1100.0: (255, 84, 0, 255,), 1150.0: (255, 51, 0, 255,), 1200.0: (255, 11, 0, 255,),
    -999: (0, 0, 0, 0), 65535: (0, 0, 0, 0)
}


max_len = None


def loader(file_name):
    return nc.Dataset(file_name)


def color_mapping(data):
    if data is None:
        return

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
        if keys[index] == -999 or (keys[index] == 65535):
            r[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = 0
            g[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = 0
            b[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = 0
            a[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = 0
            continue
        r[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
        channel_color[keys[index]][0]
        g[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
        channel_color[keys[index]][1]
        b[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
        channel_color[keys[index]][2]
        a[np.where(np.greater_equal(data[::], keys[index]) & np.less(data[::], keys[index + 1]))] = \
        channel_color[keys[index]][3]

    a[np.where(np.greater(data[::], 1100.0) | np.less(data[::], 1.0))] = 0

    img = np.dstack([r, g, b, a])
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

        data_set = loader(file_name)
        data = data_set.variables["CTP"]
        data = np.asarray(data)
        resolution = get_resolution(file_name)
        geo_range = [south, north, west, east, 0.01 if resolution == "1000M" else 0.02 if resolution == "2000M" else 0.04]
        line, column = projection.getlinecolum(geo_range, resolution)
        data = data[line, column]
        data = color_mapping(data)

        array_to_image(data, out_path)
        print("Success")
    except:
        import traceback

        traceback.print_exc()
        print("Failed")
# python cloud_top_pressure.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CTP\FY4A-_AGRI--_N_DISK_1047E_L2-_CTP-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CTP\FY4A-_AGRI--_N_DISK_1047E_L2-_CTP-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.PNG
