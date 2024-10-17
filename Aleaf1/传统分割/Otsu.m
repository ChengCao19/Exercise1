function I = Otsu(A)
% 输入参数:
%   A：灰度图象
% 输出参数：
%   I：分割后的图像
 
I = A;    
[X,Y]=size(I);
V_max=max(max(I));
V_min=min(min(I));
T=graythresh(I)	    % 运用graythresh函数计算阈值Tmax
Tmax=T*255
for i=1:X
    for j=1:Y   
        if(I(i,j)<=Tmax)
          I(i,j)=0;
        else
          I(i,j)=1;
        end
    end
end

I=double(I);
