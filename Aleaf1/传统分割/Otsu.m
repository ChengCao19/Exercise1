function I = Otsu(A)
% �������:
%   A���Ҷ�ͼ��
% ���������
%   I���ָ���ͼ��
 
I = A;    
[X,Y]=size(I);
V_max=max(max(I));
V_min=min(min(I));
T=graythresh(I)	    % ����graythresh����������ֵTmax
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
