%% 测试
% 加载训练好的模型
clear,clc;
load trainedNet.mat
[file,path] = uigetfile('D:\Aleaf1\test_image');
filepath = fullfile(path,file);
I = imread(filepath);
imshow(I);
% 分割图像
C= semanticseg(I,net);
% 展示分割结果
cmap = ColorMap;                            %必要函数1，这里需要更改函数内参数，即指定分类区域颜色
B = labeloverlay(I,C,'ColorMap',cmap);
imshow(B)
%saveas(gcf, 'result1.png');