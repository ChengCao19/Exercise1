%本程序是利用最大类间方差算法求解自适应阈值，对图像进行分割
clear;
warning off;

% web -browser http://www.ilovematlab.cn/thread-10282-1-1.html
SE = strel('diamond',4);
BW1 = imread('moli.jpg');
BW2 = imerode(BW1,SE);
BW3 = imdilate(BW2,SE);
BW4 = BW1-BW3;

%rgb转灰度
if isrgb(BW4)==1
    I_gray=rgb2gray(BW4);
else
    I_gray=BW4;
end
figure,imshow(I_gray);
I_double=double(I_gray);%转化为双精度
[wid,len]=size(I_gray);
colorlevel=256;  %灰度级
hist=zeros(colorlevel,1);%直方图
%threshold=128; %初始阈值

%计算直方图
for i=1:wid
    for j=1:len
        m=I_gray(i,j)+1;
        hist(m)=hist(m)+1;
    end
end
hist=hist/(wid*len);%直方图归一化
miuT=0;
for m=1:colorlevel
    miuT=miuT+(m-1)*hist(m);
end
xigmaB2=0;

for mindex=1:colorlevel
    threshold=mindex-1;
    omega1=0;
    omega2=0;
    for m=1:threshold-1
          omega1=omega1+hist(m);
    end
    omega2=1-omega1;
    miu1=0;
    miu2=0;

    for m=1:colorlevel
        if m<threshold
           miu1=miu1+(m-1)*hist(m);
        else
           miu2=miu2+(m-1)*hist(m);
        end
    end
    miu1=miu1/omega1;
    miu2=miu2/omega2;
    xigmaB21=omega1*(miu1-miuT)^2+omega2*(miu2-miuT)^2;
    xigma(mindex)=xigmaB21;
    if xigmaB21>xigmaB2
        finalT=threshold;
        xigmaB2=xigmaB21;
    end
end
fT=finalT/255 %阈值归一化
T=graythresh(I_gray)%matlab函数求阈值
for i=1:wid
    for j=1:len
        if I_double(i,j)>finalT
            bin(i,j)=1;
        else
            bin(i,j)=0;
        end
    end
end
figure,imshow(bin);
figure,plot(1:colorlevel,xigma);
