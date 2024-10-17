function I = Iterative(A)
% �������:
%   A���Ҷ�ͼ��
% ���������
%   I���ָ���ͼ��
 
I = A;                  
[X,Y] = size(I);
T = 0.5*(double(min(I(:)))+double(max(I(:))));	% ��ʼ�ָ���ֵ
done=false;

while~done	 % �����ָ�
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
