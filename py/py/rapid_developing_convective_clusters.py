import sys

import h5py
import numpy as np
from PIL import Image

import projection

import warnings
warnings.filterwarnings("ignore")

channel_color = {
    -2: (0x04, 0xbf, 0xfc, 255), -1: (0x04, 0x04, 0xfc, 255), 1: (0x00, 0xff, 0xff, 255), 0: (0, 0, 0, 0), 255: (0, 0, 0, 0)
}


max_len = None


def loader(file_name):
    return h5py.File(file_name, "r")


def color_mapping(data):
    if data is None:
        return
    data = data.astype(np.uint8)
    r = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    g = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    b = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    a = np.zeros((data.shape[0], data.shape[1]), dtype=np.uint8)
    for k, v in channel_color.items():
        r[np.where(np.equal(data[::], k))] = v[0]
        g[np.where(np.equal(data[::], k))] = v[1]
        b[np.where(np.equal(data[::], k))] = v[2]
        a[np.where(np.equal(data[::], k))] = v[3]
    img = np.dstack([r, g, b, a])
    return img


def array_to_image(data: np.ndarray, save_path):
    image = Image.fromarray(data, "RGBA")
    # image.show()
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

        # file_name = r"E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CIX\040000\FY4A-_AGRI--_N_DISK_1047E_L2-_CIX-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC"
        # out_path = r"E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CIX\040000\FY4A-_AGRI--_N_DISK_1047E_L2-_CIX-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.PNG"

        data_set = loader(file_name)
        data = data_set["Convective_Initiation"]
        data = np.array(data)
        # data = data.astype(np.int16)
        data = color_mapping(data)

        resolution = get_resolution(file_name)
        geo_range = [south, north, west, east, 0.01 if resolution == "1000M" else 0.02 if resolution == "2000M" else 0.04]
        line, column = projection.getlinecolum(geo_range, resolution)
        data = data[line, column]
        array_to_image(data, out_path)
        print("Success")
    except:
        import traceback

        traceback.print_exc()
        print("Failed")

# python rapid_developing_convective_clusters.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CIX\040000\FY4A-_AGRI--_N_DISK_1047E_L2-_CIX-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC E:\new\2020_fy4a\FY4A_data\product_NC202005270400\CIX\040000\FY4A-_AGRI--_N_DISK_1047E_L2-_CIX-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.PNG
