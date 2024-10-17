function I = Iterative(A)
% 输入参数:
%   A：灰度图象
% 输出参数：
%   I：分割后的图像
 
I = A;                  
[X,Y] = size(I);
T = 0.5*(double(min(I(:)))+double(max(I(:))));	% 初始分割阈值
done=false;

while~done	 % 迭代分割
    g=I>=T;
    Tnext=0.5*(mean(I(g))+mean(I(~g)));
    done=abs(T-Tnext)<0.5;
    T=Tnext;
end

for i=1:X
    for j=1:Y   
        if(I(i,j)<=T)
          I(i,j)=0;
        else
          I(i,j)=1;
        end
    end
end

I=double(I);
