import sys,os
import copy
import netCDF4 as nc
import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from projection import getlinecolum
from projection import get_column_from_line

levels = [240, 260, 280, 285, 290, 295, 300, 305, 310, 320, 325, 330, 340]
# collev = ['#FFE186','#FDDC68','#FEAE67','#FE813F','#F4580E','#DD370D']
collev = [[0x04, 0x3e, 0xfc, 255], [0x4d, 0xd7, 0xe7, 255], [0x04, 0xfc, 0x74, 255], [0x6c, 0xfc, 0x04, 255],
          [0xb0, 0xfc, 0x04, 255], [0xd3, 0xfc, 0x04, 255], [0xe4, 0xfc, 0x04, 255], [0xec, 0xfc, 0x04, 255],
          [0xf4, 0xfc, 0x04, 255], [0xfc, 0xfc, 0x04, 255], [0xfc, 0xf4, 0x04, 255], [0xfc, 0xe0, 0x04, 255],
          [0xfc, 0xc7, 0x04, 255], [0xfc, 0x98, 0x04, 255], [0xfc, 0x3d, 0x04, 255], [0xfc, 0x2d, 0x00, 255],
          [0xfc, 0x0d, 0x00, 255]]

max_len=1024

def main(geo_range,inputFile,out_path,max_len):
    #-------------------------------------【1】读数据
    dataset = nc.Dataset(inputFile)
    LST = dataset.variables["LST"]
    valid_range = dataset.variables["LST"].valid_range
    resolution = dataset.variables["LST"].resolution

    LST = np.array(LST)
    #图像上下翻转
    # LST = np.flipud(LST)

    #----------------------------------------【2】生成图像
    img = getImg(LST,valid_range)

    #-----------------------------------------【3】投影转换
    # 指定经纬度范围
    resolution = '4000M'
    #step = resolution / 100.0
    # geo_range = [-54.96, 54.96, 49.74, 159.66,0.04]
    geo_range.append(0.04)
    line, column = getlinecolum(geo_range, resolution)
    line = line - 104
    projImg = img[line, column]

    image = Image.fromarray(projImg)
    image = image.resize((get_column_from_line(projImg.shape[0], projImg.shape[1], max_len)),
                         Image.ANTIALIAS)
    image.save(out_path)
    image.close()

def getImg(data,valid_range):
    # 处理后，取出所有无效值的下标
    # 去除无效值
    valid_range_min = np.min(valid_range)
    valid_range_max = np.max(valid_range)
    data[(data > valid_range_max)|(data==0)] ='NAN'
    # nanId = np.isnan(data)

    # nanId = np.isnan(data)
    data00 = np.zeros((2748, 2748))
    data00[data00 == 0] = 'NAN'
    m = data.shape[0]
    data00[70:(70 + m), :] = data
    nanId = np.where((data00 == 255) | (data00 == 0) | np.isnan(data00))

    # 出图必须转换数据格式
    nd_cha = np.uint8(data00)
    # 建立一个透明度数组，初始化时全部为不透明（0为完全透明，255为完全不透明）
    # transparencyMat = np.zeros((nd_cha.shape[0], nd_cha.shape[1]), dtype=np.uint8)
    transparencyMat = np.zeros((2748, 2748), dtype=np.uint8)
    transparencyMat[:, :] = 255

    # 灰度图转RGB图
    nd_cha_R = copy.deepcopy(nd_cha)
    nd_cha_G = copy.deepcopy(nd_cha)
    nd_cha_B = copy.deepcopy(nd_cha)
    for i in range(0, len(levels) - 1):
        nd_cha_R[(data00 >= levels[i]) & (data00 < levels[i + 1])] = collev[i][0]
        nd_cha_G[(data00 >= levels[i]) & (data00 < levels[i + 1])] = collev[i][1]
        nd_cha_B[(data00 >= levels[i]) & (data00 < levels[i + 1])] = collev[i][2]

    # 建立一个三维数组（宽度*高度*4（rgba）），R\G\B\A,作为出图数组
    img = np.dstack((nd_cha_R,
                     nd_cha_G,
                     nd_cha_B,
                     transparencyMat))
    # 所有无效值变成rgba为15,0,0,255的像素
    img[nanId] = [0, 0, 0, 0]
    # outpngPath = os.path.join(os.path.dirname(out_path),"LST.png")
    # Image.fromarray(img).save(outpngPath)
    return img

if __name__ == '__main__':
    # inputFile = r"D:\Project\FY4\LST\REGC\20200527\004918" \
    #    r"\FY4A-_AGRI--_N_REGC_1047E_L2-_LST-_MULT_NOM_20200527004918_20200527005335_4000M_V0001.NC"
    # out_path = r"D:\Project\FY4\LST\REGC\20200527\004918\QuickView\LST_proj.png"
    # geo_range = [-54.96, 54.96, 49.74, 159.66]
    # main(geo_range,inputFile,out_path)
    # print("ok")

    try:
        if len(sys.argv) != 8:
            print("参数数量应该为7个，当前数量{}个".format(len(sys.argv) - 1), file=sys.stderr)
            sys.exit(0)
        south = float(sys.argv[1])
        north = float(sys.argv[2])
        west = float(sys.argv[3])
        east = float(sys.argv[4])
        inputFile = sys.argv[5]
        out_path = sys.argv[6]
        max_len = int(sys.argv[7])

        geo_range = [south,north,west,east]

        main(geo_range,inputFile,out_path,max_len)
        print("Success")
    except:
        print("Failed")