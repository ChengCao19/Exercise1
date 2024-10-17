%% 制作数据集
%清空变量，加载语义分割的数据
clear
clc
load gTruth.mat;
% 导入图片
imgDir = fullfile('D:\Aleaf\train_image');
imds = imageDatastore(imgDir);
% 显示一张图片
I = readimage(imds,1);
I = histeq(I);
imshow(I)
% 导入并制作像素标签
classes = [
    "back"
    "leaf"
           ];    %定义类别名称
pxds = pixelLabelDatastore(gTruth);%制作像素类别标签
 
% 显示其中一张图片并叠加标注信息
C = readimage(pxds,1);
cmap = ColorMap;
B = labeloverlay(I,C,'ColorMap',cmap);
imshow(B)
pixelLabelColorbar(cmap,classes);