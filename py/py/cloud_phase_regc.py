import sys

import netCDF4 as nc
import numpy as np
from PIL import Image

import projection

import warnings
warnings.filterwarnings("ignore")

channel_color = {
    1: (0, 0, 244, 255), 2: (32, 165, 224, 255), 3: (33, 255, 172, 255), 4: (254, 0, 0, 255), 5: (225, 180, 1, 255),
    0: (0, 0, 0, 0), 126: (0, 0, 0, 0), 127: (0, 0, 0, 0)
}


max_len = None


def loader(file_name):
    return nc.Dataset(file_name)


def color_mapping(data):
    if data is None:
        return

    data00 = np.zeros((2748, 2748))
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
    for k, v in channel_color.items():
        r[np.where(np.equal(data[::], k))] = v[0]
        g[np.where(np.equal(data[::], k))] = v[1]
        b[np.where(np.equal(data[::], k))] = v[2]
        a[np.where(np.equal(data[::], k))] = v[3]
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

        data_set = loader(file_name)
        data = data_set.variables["CLP"]
        data = np.asarray(data)
        data = color_mapping(data)

        resolution = get_resolution(file_name)
        geo_range = [south, north, west, east, 0.01 if resolution == "1000M" else 0.02 if resolution == "2000M" else 0.04]
        line, column = projection.getlinecolum(geo_range, resolution)
        line = line - 104
        data = data[line, column]
        array_to_image(data, out_path)
        print("Success")
    except:
        import traceback
        traceback.print_exc()
        print("Failed")

# python cloud_phase.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CLP\FY4A-_AGRI--_N_DISK_1047E_L2-_CLP-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CLP\FY4A-_AGRI--_N_DISK_1047E_L2-_CLP-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.PNG 1024