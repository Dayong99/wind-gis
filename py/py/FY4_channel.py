import sys

from PIL import Image
import netCDF4 as nc
import numpy as np

import projection

import warnings
warnings.filterwarnings("ignore")

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

line, column = None, None

channels = {
    "1000M": ["01", "02", "03"],
    "2000M": ["01", "02", "03", "04", "05", "06", "07"],
    "4000M": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14"]
}


max_len = None


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


def data_to_image(data_set, resolution, out_path: str, geo_range: list):
    if resolution not in channels.keys():
        return
    ch = channels[resolution]
    global line, column
    line, column = projection.getlinecolum(geo_range, resolution)

    for i in ch:
        print("generate NOMChannel{}...".format(i))
        cache_d = data_set.variables["NOMChannel{}".format(i)]
        d = np.array(cache_d)
        d = projection.calc(d)
        # a = d.copy()
        # a[::] = 255
        # a[np.where(np.greater(cache_d[::], 4095))] = 0
        data_img = np.dstack([d.copy(), d.copy(), d.copy()])
        data_img = data_img.astype(np.uint8)[line, column]
        # data_img = data_img.astype(np.uint8)
        img = Image.fromarray(data_img)
        img_name = "{}Channel{}_{}.JPG".format(
            out_path, int(i), "1" if resolution == "1000M" else "2" if resolution == "2000M" else "4"
        )
        img = img.resize((projection.get_column_from_line(img.height, img.width, max_len)), Image.ANTIALIAS)
        img.save(img_name)
        img.close()


def channel_to_color(data_set, save_name):
    r = data_set.variables["NOMChannel02"]
    g = data_set.variables["NOMChannel01"]
    r = np.array(r)
    g = np.array(g)
    img_r = projection.calc(r)
    img_g = projection.calc(g)
    img_r[np.where(np.greater(r[::], 4095))] = 0
    img_g[np.where(np.greater(g[::], 4095))] = 0
    img_b = img_g.copy()
    # a = np.zeros([img_r.shape[0], img_r.shape[1]], dtype="uint8")
    # a[::] = 255
    img = np.dstack((img_r, img_g, img_b))[line, column]
    # img = np.dstack((img_r, img_g, img_b))
    img = img.astype(np.uint8)
    image = Image.fromarray(img, "RGB")
    image = image.resize((projection.get_column_from_line(image.height, image.width, max_len)), Image.ANTIALIAS)
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

        r = 1 if resolution == "1000M" else 2 if resolution == "2000M" else 4
        channel_to_color(data, "{}{}_{}.JPG".format(out_name, "true_colors", r))
        data.close()
        print("Success")
    except:
        import traceback

        traceback.print_exc()
        print("Failed")

# python FY4_channel.py -54.96 54.96 49.74 159.66 E:\new\2020_fy4a\FY4A_data\imager_NC202005270400\FY4A-_AGRI--_N_DISK_1047E_L1-_FDI-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC ./ 2748
