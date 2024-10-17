function I = MaxEntropy(A)
% 输入参数:
%   A：灰度图象
% 输出参数：
%   I：分割后的图像
 
I = A;    
[X,Y]=size(I);
V_max=max(max(I));
V_min=min(min(I));
T0=(V_max+V_min)/2;			    % 初始分割阈值
h=imhist(I);				    % 计算图像直方图
figure,plot(h);
grayp=imhist(I)/numel(I);		% 求图像像素概率   
I=double(I);
H0=-sum(grayp(find(grayp(1:end)>0)).*log(grayp(find(grayp(1:end)>0))));
cout=100;					    % 设置迭代次数为100次
while(cout>0)
    Tmax=0;					    % 初始化
    grayPd=0;  
    grayPb=0;
    Hd=0;
    Hb=0;
    T1=T0;
    A1=0;
    A2=0;
    B1=0;
    B2=0;
    for i=1:X					% 计算灰度平均值
        for j=1:Y
            if(I(i,j)<=T1)
                A1=A1+1;
                B1=B1+I(i,j);
            else
                A2=A2+1;
                B2=B2+I(i,j);
            end
        end
    end
    M1=B1/A1;
    M2=B2/A2;
    T2=(M1+M2)/2; 
    TT=round(T2);
    grayPd=sum(grayp(1:TT));      % 计算分割区域G1的概率和        
    if grayPd==0                      
       grayPd=eps;
    end
    grayPb=1-grayPd;
    if grayPb==0
        grayPb=eps;
    end
    Hd=-sum((grayp(find(grayp(1:TT)>0))/grayPd).*log((grayp(find(grayp(1:TT)>0))/grayPd))); 
    % 计算分割后区域G1的信息熵
    Hb=-sum(grayp(TT+(find(grayp(TT+1:end)>0)))/grayPb.*log(grayp(TT+(find(grayp(TT+1:end)>0)))/grayPb));
    % 计算分割后区域G2的信息熵

    H1=Hd+Hb;
    cout=cout-1;
    if  (abs(H0-H1)<0.0001)|(cout==0)
        Tmax=T2;
        break;
    else
        T0=T2;
        H0=H1;
    end
end

Tmax
cout

for i=1:X	% 根据所求阈值Tmax转换图像
    for j=1:Y   
        if(I(i,j)<=Tmax)
        I(i,j)=0;
        else
        I(i,j)=1;
        end
    end
end
