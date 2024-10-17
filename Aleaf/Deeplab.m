%% 制作语义分割网络DeeplabV3+
% 定义网络输入大小，与图像大小相等.
imageSize = [400 500 3];
 
% 定义类别数量.
numClasses = numel(classes);
 
% 构建deeplabV3+.
lgraph = deeplabv3plusLayers(imageSize, numClasses, "xception");%基于xception时bitch为2，基于mobilenet时bitch为6
% lgraph = load('Deep-MbV2.mat');
% lgraph = lgraph.mb53;%mobilenet-512分辨率-3类

% 设置类别权重
imageFreq = tbl.PixelCount ./ tbl.ImagePixelCount;
classWeights = median(imageFreq) ./ imageFreq;

%% 设置训练参数

options = trainingOptions('adam', ...
    'LearnRateSchedule','piecewise',...
    'LearnRateDropPeriod',10,...   %学习率下降期
    'LearnRateDropFactor',0.4,...  %学习率下降因素
    'InitialLearnRate',1e-4, ...   %初始学习率
    'L2Regularization',0.005, ...  %L2 正则化
    'MaxEpochs',2, ...             %最大时期
    'MiniBatchSize',2, ...         %小批量
    'Shuffle','every-epoch', ...   
    'VerboseFrequency',2,...       %详细频率
    'Plots','training-progress');

% % 图像增强
augmenter = imageDataAugmenter('RandXReflection',true,...     %RandXReflection：水平方向随机翻转。若设置为1，则图像增强时有50%的几率进行翻转，默认为0，即不翻转
     'RandXTranslation',[-10 10],'RandYTranslation',[-10 10]);
pximds = pixelLabelImageDatastore(imds,pxds,...
    'DataAugmentation',augmenter); 
% 训练网络
[net, info] = trainNetwork(pximds,lgraph,options);
% 保存网络
% save('trainedNet.mat','net');
% save('trainedInfo.mat','info');