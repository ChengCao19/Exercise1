%% 棉花图像的批量处理与保存 
clear;
clc;
srcFace = 'D:\Aleaf2\test_image';%被读取文件的存放目录
fileSavePath='D:\Aleaf2\save_segimage';%文件保存目录
src=srcFace;
srcsuffix='.jpg';%被读取的文件名后缀（根据被读取文件的实际文件类型设置）
srcsuffixSave='.jpg';%保存文件名后缀（根据自己需要更改设置）
files = dir(fullfile(src, strcat('*', srcsuffix)));
doDispOrSave = true ;% 是否显示或保存图像；可以设置为：true 或者 false
for file_i= 1 : length(files)
    disp(file_i);%显示当前处理的文件序号
    srcName = files(file_i).name;
    noSuffixName = srcName(1:end-4);
    srcName1=files(file_i).name;
    pathImgName=sprintf('%s%s%s',src,'\',srcName1);
    imgSrc=imread(pathImgName);%读入图像
    %对读入的图像进行图像分割处理
    load trainedNet.mat
    segimage= semanticseg(imgSrc,net);
    cmap = ColorMap;                            
    B = labeloverlay(imgSrc,segimage,'ColorMap',cmap);
    %保存处理后的文件
    savePathName=sprintf('%s%s%s%s',fileSavePath,'\',noSuffixName,srcsuffixSave);
    imwrite(B,savePathName);
end