__author__ = "shinjawkwang@naver.com"
# 이 프로그램은 악의 꽃 시간표 조정을 위해 제작한 프로그램입니다.
# 에브리타임 앱 내의 시간표 "이미지로 저장" 기능으로 저장한 시간표 이미지를 요합니다.
# 배경색이 흰색인 테마의 시간표 이미지만 사용가능합니다.

import glob
import os

from PIL import Image
import numpy as np
import cv2


def CalcSize(files):
    # Calculate x_size and y_size of images included in "files"
    size_x = []
    size_y = []

    for file in files:
        img = Image.open(file)
        size_x.append(img.size[0])
        size_y.append(img.size[1])
    print(size_x)
    print(size_y)


def ConvertColor(files, target_dir):
    i = 0
    for file in files:
        j = str(i)
        outfile = target_dir + j + "_black.jpg"
        img = Image.open(file)
        img = img.convert("L")
        img.save(outfile)
        i += 1

def CalcRowLevel(files):
    for file in files:
        img = cv2.imread(file)


def main():
    print("# Welcome to Everytime Schedule MAkEr")
    # Enter Your Path
    # target_dir = input("INPUT PATH : ")
    # == Default Path in BOOTY, Windows ============
    target_dir = "C:\\Users\\Shinjaekwang\\Dropbox\\Code\\2018\\LFDM_PYthon\\Images\\"
    # ==============================================
    print(target_dir)
    files = glob.glob(target_dir + "*.jpg")

    ConvertColor(files, target_dir)

    b_files = glob.glob(target_dir + "*_black.jpg")

    # After Process, Remove Blaked Files
    for file in b_files:
        os.remove(file)
    print("# Finish! Check RESULT.jpg.")


if __name__ == "__main__":
    main()
