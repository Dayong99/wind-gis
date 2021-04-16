#!/usr/bin/env python
# coding: utf-8

# In[1]:


import sys

from PIL import Image, ImageEnhance
import netCDF4 as nc
import numpy as np
from fy4a import FY4A_AGRI_L1

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


def data_to_image(data, resolution, input_name: str, geo_range: list):
    if resolution not in channels.keys():
        return
    ch = channels[resolution]
#     geo_range = '10, 54, 50, 160, 0.04'
    for i in ch:
        print("generate {}...".format(i))
        data_set.extract(i,geo_range)
        data = data_set.channels[i]
        data[np.isnan(data)]=0
        
        if "Channel01" == i:
            channel_one = np.array(img)
        elif "Channel02" == i:
            channel_two = np.array(img)
            
        Imax = np.max(data)
        Imin = np.min(data)
        output = (data - Imin) / (Imax - Imin) * (255 - 0) + 0

        img = Image.fromarray(output)
        img = img.convert("L")
        img = img.resize(projection.get_column_from_line(img.height, img.width, max_len))
        image.save(img_name)
        image.close()
    


def channel_to_color(save_name):
    print("generate true_color...")
    img_r = channel_two[:, :, 0]
    img_g = channel_one[:, :, 0]
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
        name = "{}{}_{}.JPG".format(out_name, "true_color",
                                    1 if resolution == "1000M" else 2 if resolution == "2000M" else 4)
        channel_to_color(name)
        data.close()
        print("Success")
    except Exception as e:
        import traceback

        traceback.print_exc()
        print("Failed")

# python FY4_channel_regc.py 3 55 60 137 E:\new\2020_fy4a\FY4A_data\AGRI\REGC\105336\FY4A-_AGRI--_N_REGC_1047E_L1-_FDI-_MULT_NOM_20200527105336_20200527105753_1000M_V0001.HDF ./ 2748

