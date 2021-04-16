import sys
import copy
import netCDF4 as nc
import numpy as np
from PIL import Image
from projection import getlinecolum
from projection import get_column_from_line

# levels = [0.1,1,2,4,6,8,10,20,31]
levels = [0.1, 2.5, 5, 7.5, 10, 12.5, 15, 17.5, 20, 22.5, 25, 27.5, 30, 33.3, 36.6, 39.9, 43.2, 46.5, 50]  # 绿色 2.5 8个色 蓝色 2.5 4个值 红 3.33 10个值
# collev = ['#FFE186','#FDDC68','#FEAE67','#FE813F','#F4580E','#DD370D']
# collev = [[211, 250, 187, 255],[172, 232, 158, 255],[62, 164, 2, 255],[95, 180, 245, 255],[0, 2, 251, 255]
#           ,[0, 113, 77, 255],[248, 4, 242, 255],[239, 74, 0, 255],[104, 3, 7, 255]]

collev = [[0x04, 0x69, 0x04, 255], [0x48, 0x6c, 0x24, 255], [0x04, 0xb4, 0x4c, 255], [0x04, 0xb8, 0x04, 255],
          [0x04, 0xe0, 0x14, 255], [0x48, 0xd8, 0x24, 255], [0x04, 0x91, 0x6e, 255], [0x48, 0x90, 0x70, 255],
          [0x04, 0x6c, 0x94, 255], [0x04, 0x64, 0x9c, 255], [0x04, 0x4b, 0xb4, 255], [0x04, 0x34, 0xcc, 255],
          [0x1a, 0x0c, 0xf3, 255], [0xa0, 0x04, 0xfc, 255], [0xe9, 0x04, 0xf0, 255], [0xfc, 0x04, 0xb2, 255],
          [0xfc, 0x04, 0x7d, 255], [0xc4, 0x84, 0x80, 255], [0xfc, 0x04, 0x34, 255]]

max_len=1024

def main(geo_range,inputFile,out_path, max_len):
    #-------------------------------------【1】读数据
    dataset = nc.Dataset(inputFile)
    Precipitation = dataset.variables["Precipitation"]
    valid_range = dataset.variables["Precipitation"].valid_range
    # resolution = dataset.variables["Precipitation"].resolution

    Precipitation = np.array(Precipitation)
    #图像上下翻转
    # Precipitation = np.flipud(Precipitation)

    #----------------------------------------【2】生成图像
    img = getImg(Precipitation,valid_range)

    #-----------------------------------------【3】投影转换
    # 指定经纬度范围
    resolution = '4000M'
    #step = resolution / 100.0
    # geo_range = [-54.96, 54.96, 49.74, 159.66,0.04]
    geo_range.append(0.04)
    line, column = getlinecolum(geo_range, resolution)
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
    nanId = np.isnan(data)

    # 出图必须转换数据格式
    nd_cha = data
    # 建立一个透明度数组，初始化时全部为不透明（0为完全透明，255为完全不透明）
    transparencyMat = np.zeros((nd_cha.shape[0], nd_cha.shape[1]), dtype=np.uint8)
    transparencyMat[:, :] = 255

    #灰度图转RGB图
    nd_cha_R = copy.deepcopy(nd_cha)
    nd_cha_G = copy.deepcopy(nd_cha)
    nd_cha_B = copy.deepcopy(nd_cha)
    for i in range(0,len(levels)-1):
        nd_cha_R[(data >= levels[i]) & (data < levels[i + 1])] = collev[i][0]
        nd_cha_G[(data >= levels[i]) & (data < levels[i + 1])] = collev[i][1]
        nd_cha_B[(data >= levels[i]) & (data < levels[i + 1])] = collev[i][2]

    # 建立一个三维数组（宽度*高度*4（rgba）），R\G\B\A,作为出图数组
    img = np.dstack((nd_cha_R,
                     nd_cha_G,
                     nd_cha_B,
                     transparencyMat))
    # 所有无效值变成rgba为15,0,0,255的像素
    img[nanId] = [0, 0, 0, 0]
    # outpngPath = os.path.join(os.path.dirname(out_path), "Precipitation.png")
    # Image.fromarray(img).save(outpngPath)
    return img

if __name__ == '__main__':
    # inputFile = r"D:\Project\FY4\QPE\DISK\20200527\010000" \
    #    r"\FY4A-_AGRI--_N_DISK_1047E_L2-_QPE-_MULT_NOM_20200527010000_20200527011459_4000M_V0001.NC"
    # out_path = r"D:\Project\FY4\QPE\DISK\20200527\010000\QuickView\Precipitation_proj.png"
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

        main(geo_range,inputFile,out_path, max_len)
        print("Success")
    except:
        import traceback
        traceback.print_exc()
        print("Failed")

# python FY4_channel.py -54.96 54.96 49.74 159.66 C:\Users\Administrator\Desktop\FY4A-_AGRI--_N_DISK_1047E_L2-_QPE-_MULT_NOM_20200527110000_20200527111459_4000M_V0001.NC C:\Users\Administrator\Desktop\FY4A-_AGRI--_N_DISK_1047E_L2-_QPE-_MULT_NOM_20200527110000_20200527111459_4000M_V0001.PNG 2748
