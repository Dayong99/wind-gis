# -*- coding: utf-8 -*-
"""
FY-4A标称（NOM）全圆盘（DISK）数据的行列号经纬度互转
参考国家卫星气象中心FY-4A数据行列号和经纬度的互相转换方法

Created on 2018/11/08 21:25:32
@author: modabao
"""

import numpy as np
from PIL import Image, ImageEnhance
from numpy import deg2rad, rad2deg, arctan, arcsin, tan, sqrt, cos, sin

ea = 6378.137  # 地球的半长轴[km]
eb = 6356.7523  # 地球的短半轴[km]
h = 42164  # 地心到卫星质心的距离[km]
λD = deg2rad(104.7)  # 卫星星下点所在经度
# 列偏移11000.5;5500.5
COFF = {"0500M": 10991.5,
        "1000M": 5495.5,
        "2000M": 2747.5,
        "4000M": 1373.5}
# 列比例因子
CFAC = {"0500M": 81865099,
        "1000M": 40932549,
        "2000M": 20466274,
        "4000M": 10233137}
LOFF = COFF  # 行偏移
LFAC = CFAC  # 行比例因子


def getlinecolum(geo_range, resolution):
    # 经纬度先乘1000取整是为了防止浮点数的精度误差累积
    lat_S, lat_N, lon_W, lon_E, step = [int(1000 * x) for x in geo_range]
    lat = np.arange(lat_N, lat_S - 1, -step) / 1000
    lon = np.arange(lon_W, lon_E + 1, step) / 1000
    lon_mesh, lat_mesh = np.meshgrid(lon, lat)
    # 经纬度转行列号
    line, column = latlon2linecolumn(lat_mesh, lon_mesh, resolution)
    # 求整
    line = np.rint(line).astype(np.uint16)
    column = np.rint(column).astype(np.uint16)
    # print("line", line.shape, "column", column.shape)
    return line, column


def latlon2linecolumn(lat, lon, resolution):
    """
    (lat, lon) → (line, column)
    resolution：文件名中的分辨率{'0500M', '1000M', '2000M', '4000M'}
    line, column不是整数
    """
    # Step1.检查地理经纬度
    # Step2.将地理经纬度的角度表示转化为弧度表示
    lat = deg2rad(lat)
    lon = deg2rad(lon)
    # Step3.将地理经纬度转化成地心经纬度
    eb2_ea2 = eb ** 2 / ea ** 2
    λe = lon
    φe = arctan(eb2_ea2 * tan(lat))
    # Step4.求Re
    cosφe = cos(φe)
    re = eb / sqrt(1 - (1 - eb2_ea2) * cosφe ** 2)
    # Step5.求r1,r2,r3
    λe_λD = λe - λD
    r1 = h - re * cosφe * cos(λe_λD)
    r2 = -re * cosφe * sin(λe_λD)
    r3 = re * sin(φe)
    # Step6.求rn,x,y
    rn = sqrt(r1 ** 2 + r2 ** 2 + r3 ** 2)
    x = rad2deg(arctan(-r2 / r1))
    y = rad2deg(arcsin(-r3 / rn))
    # Step7.求c,l
    column = COFF[resolution] + x * 2 ** -16 * CFAC[resolution]
    line = LOFF[resolution] + y * 2 ** -16 * LFAC[resolution]
    return line, column


def linecolumn2latlon(line, column, resolution):
    """
    (line, column) → (lat, lon)
    resolution：文件名中的分辨率{'0500M', '1000M', '2000M', '4000M'}
    """
    # Step1.求x,y
    x = deg2rad((column - COFF[resolution]) / (2 ** -16 * CFAC[resolution]))
    y = deg2rad((line - LOFF[resolution]) / (2 ** -16 * LFAC[resolution]))
    # Step2.求sd,sn,s1,s2,s3,sxy
    cosx = cos(x)
    cosy = cos(y)
    siny = sin(y)
    cos2y = cosy ** 2
    hcosxcosy = h * cosx * cosy
    cos2y_ea_eb_siny_2 = cos2y + (ea / eb * siny) ** 2
    sd = sqrt(hcosxcosy ** 2 - cos2y_ea_eb_siny_2 * (h ** 2 - ea ** 2))
    sn = (hcosxcosy - sd) / cos2y_ea_eb_siny_2
    s1 = h - sn * cosx * cosy
    s2 = sn * sin(x) * cosy
    s3 = -sn * siny
    sxy = sqrt(s1 ** 2 + s2 ** 2)
    # Step3.求lon,lat
    lon = rad2deg(arctan(s2 / s1) + λD)
    lat = rad2deg(arctan(ea ** 2 / eb ** 2 * s3 / sxy))
    return lat, lon


def image_enhancement(out_path: str, image: Image = None, input_path: str = None, brightness=1.2, contrast=1.25):
    if image is None:
        image = Image.open(input_path)
    # 亮度增强
    enh_bri = ImageEnhance.Brightness(image)
    image_brightness = enh_bri.enhance(brightness)
    # 对比度增强
    enh_con = ImageEnhance.Contrast(image_brightness)
    image_contrasted = enh_con.enhance(contrast)
    # 图片出图
    image_contrasted.save(out_path)


def calc(data: np.ndarray):
    return data.copy() / 16


def get_column_from_line(line: int, column: int, max_len: int=1024):
    if line > column:
        out_line = max_len
        out_column = (column * max_len) // line
    else:
        out_column = max_len
        out_line = (line * max_len) // column
    return out_column, out_line


if __name__ == '__main__':
    print(linecolumn2latlon(104, 1064, "4000M"))  # 1
    print(linecolumn2latlon(2019, 179, "4000M"))  # 2
    print(linecolumn2latlon(328, 1064, "4000M"))  # 1

    # south 90
    # north 26
    # west -34
    # east 44
# if __name__ == "__main__":
#     """
#     调用示范
#     """
#     from numpy import arange, meshgrid, concatenate, float32, newaxis
#     # 设置插值步长、经纬度范围
#     interp_steps = {"0500M": 0.005,
#                     "1000M": 0.01,
#                     "2000M": 0.02,
#                     "4000M": 0.04}
#     lat_S, lat_N = -70.383653564, 70.38653564
#     lon_W, lon_E = 70.22154999, 211.1784668
#     geo_range = [-70.383653564, 70.38653564,70.22154999, 211.1784668, 0.04]
#     # 先乘1000取整是为了防止浮点数的精度误差累积
#     lat_S, lat_N, lon_W, lon_E, step = [int(1000 * x) for x in geo_range]
#
#     lat = np.arange(lat_N, lat_S - 1, -step) / 1000
#     lon = np.arange(lon_W, lon_E + 1, step) / 1000
#
#     lon_mesh, lat_mesh = np.meshgrid(lon, lat)
#
#     line, column = latlon2linecolumn(lat_mesh, lon_mesh, "4000M")
#
#     line = np.rint(line).astype(np.uint16)  # 求整
#     column = np.rint(column).astype(np.uint16)
#
#     print("ok")
