import sys
import copy
import netCDF4 as nc
import numpy as np
from PIL import Image
from projection import getlinecolum
from projection import get_column_from_line

# levels = [1, 2, 3, 4, 6, 9, 12]
levels = [12, 15, 17, 19, 21, 23]
# collev = ['#FFE186','#FDDC68','#FEAE67','#FE813F','#F4580E','#DD370D']
# collev = [[255, 225, 134, 255], [253, 220, 104, 255], [254, 174, 103, 255],
#           [254, 129, 63, 255], [244, 88, 14, 255], [221, 55, 13, 255], [221, 10, 12, 255]]

collev = [[255, 225, 134, 255], [253, 220, 104, 255], [254, 174, 103, 255],
          [254, 129, 63, 255], [244, 88, 14, 255], [221, 55, 13, 255]]

max_len = None

def main(geo_range, inputFile, out_path, max_len):
    # -------------------------------------【1】读数据
    dataset = nc.Dataset(inputFile)
    DSD = dataset.variables["DST"]
    valid_range = dataset.variables["DST"].valid_range
    resolution = dataset.variables["DST"].resolution

    DSD = np.array(DSD)
    # 图像上下翻转
    # DSD = np.flipud(DSD)

    # ----------------------------------------【2】生成图像
    img = getImg(DSD, valid_range)

    # -----------------------------------------【3】投影转换
    # 指定经纬度范围
    resolution = '4000M'
    # step = resolution / 100.0
    # geo_range = [-54.96, 54.96, 49.74, 159.66,0.04]
    geo_range.append(0.04)
    line, column = getlinecolum(geo_range, resolution)
    projImg = img[line, column]

    image = Image.fromarray(projImg)
    image = image.resize((get_column_from_line(projImg.shape[0], projImg.shape[1], max_len)),
                         Image.ANTIALIAS)
    image.save(out_path)
    image.close()

def getImg(data, valid_range):
    # 处理后，取出所有无效值的下标
    # 去除无效值
    # data[np.where(np.less(data[::], valid_range_min) | np.greater(data[::], valid_range_max))] = 32766
    # nanId = np.equal(data[::], 32766)
    # data = data // 256
    data = data.astype(np.uint8)
    # 出图必须转换数据格式
    nd_cha = np.uint8(data)
    # 建立一个透明度数组，初始化时全部为不透明（0为完全透明，255为完全不透明）
    transparencyMat = np.zeros((nd_cha.shape[0], nd_cha.shape[1]), dtype=np.uint8)
    transparencyMat[:, :] = 255

    # 灰度图转RGB图
    nd_cha_R = copy.deepcopy(nd_cha)
    nd_cha_G = copy.deepcopy(nd_cha)
    nd_cha_B = copy.deepcopy(nd_cha)
    for i in range(0, len(levels)):
        nd_cha_R[np.greater_equal(data[::], levels[i])] = collev[i][0]
        nd_cha_G[np.greater_equal(data[::], levels[i])] = collev[i][1]
        nd_cha_B[np.greater_equal(data[::], levels[i])] = collev[i][2]
        transparencyMat[np.greater_equal(data[::], levels[i])] = collev[i][3]

    # 建立一个三维数组（宽度*高度*4（rgba）），R\G\B\A,作为出图数组
    img = np.dstack((nd_cha_R,
                     nd_cha_G,
                     nd_cha_B,
                     transparencyMat))
    # 所有无效值变成rgba为15,0,0,255的像素
    img[np.where(np.less(data[::], 12) | np.greater(data[::], 23))] = [0, 0, 0, 0]
    # outpngPath = os.path.join(os.path.dirname(out_path), "DSD.png")
    # Image.fromarray(img).save(outpngPath)
    return img


if __name__ == '__main__':
    # inputFile = r"D:\Project\FY4\DSD\DISK\20200527\040000" \
    #    r"\FY4A-_AGRI--_N_DISK_1047E_L2-_DSD-_MULT_NOM_20200527040000_20200527041459_4000M_V0001.NC"
    # out_path = r"D:\Project\FY4\DSD\DISK\20200527\010000\DSD_proj.png"
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

        geo_range = [south, north, west, east]

        main(geo_range, inputFile, out_path, max_len)
        print("Success")
    except:
        import traceback

        traceback.print_exc()
        print("Failed")

# python E:\new\2020_fy4a\processor\surface_temperature.py -54.96 54.96 49.74 159.66 C:\Users\Administrator\Desktop\FY4A-_AGRI--_N_DISK_1047E_L2-_DSD-_MULT_NOM_20200527090000_20200527091459_4000M_V0001.NC C:\Users\Administrator\Desktop\FY4A-_AGRI--_N_DISK_1047E_L2-_DSD-_MULT_NOM_20200527090000_20200527091459_4000M_V0001.PNG 2748
