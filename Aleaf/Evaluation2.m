clear,clc;
%% 语义分割评价
dataSetDir = fullfile('D:\Aleaf\');

%定义测试图像的位置。
testImagesDir = fullfile(dataSetDir,'test_image');
%定义地面实况标注的位置。
testLabelsDir = fullfile(dataSetDir,'test_label');
%创建保存测试映像的映像数据存储。
imds = imageDatastore(testImagesDir);
%定义类名及其关联的标签ID。
classNames = ["back","leaf"];
labelIDs   = [1 2];
%创建一个像素标签数据存储，其中包含测试图像的基本实况像素标签。
pxdsTruth = pixelLabelDatastore(testLabelsDir,classNames,labelIDs);

%加载已在训练图像上训练的语义分割网络。
net = load('trainedNet.mat');
net = net.net;

%在测试映像上运行网络。预测的标签将写入磁盘的临时目录，并作为 pixelLabelDatastore 返回。
pxdsResults = semanticseg(imds,net,"WriteLocation",tempdir);

%根据基本事实评估预测结果。
metrics = evaluateSemanticSegmentation(pxdsResults,pxdsTruth);
metrics.ClassMetrics               %类度量
%metrics.ImageMetrics              %图像度量（多个图像，则意义不大）
metrics.NormalizedConfusionMatrix  %归一化混淆矩阵
%metrics.ConfusionMatrix           %混淆矩阵（数值较大，一般用归一化混淆矩阵）