 %% 主程序
clear
clc
[file,path] = uigetfile('D:\Aleaf1\bbbbb');
filepath = fullfile(path,file);
I = imread(filepath);        %执行区域生长节时，注释此行
%% 不同的图像分割算法
% BW=Otsu(I);                %阈值分割1
% BW=Bayesian(I);            %最佳阈值分割
% BW=Iterative(I);           %
% [mu,BW]=Kmeans(I,10);      %k-means算法
% BW=fgcl(I);                %自适应阈值
% BW=MaxEntropy(I);          %最大熵
% BW=MeanShiftSeg(I,8);
%% 区域生长
% I = im2double(imread(filepath));
% x=250;y=200;
% BW=RegionGrowing(I,x,y,0.2);
% figure(2);imshow(I+BW)
%% 分割展示
figure(2);imshow(BW)
