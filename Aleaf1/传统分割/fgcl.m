function out=fgcl(I)
%����ͼ��ĻҶ���Сֵ�����ֵ
tmin = min(I(:));
tmax = max(I(:));
%�趨��ʼ��ֵ
th = (tmin+tmax)/2;
%���忪�ر��������ڿ���ѭ������
ok = true;
%������������ֵ
while ok
    g1 = I >= th;
    g2 = I < th;
    u1 = mean(I(g1));
    u2 = mean(I(g2));
    thnew = (u1+u2)/2;
    %�趨������ֵ�ıȽϵ�����С��1ʱֹͣѭ��
    ok = abs(th - thnew) >= 1;
    th = thnew;
end
th = floor(th);
%��ֵ�ָ�
J = im2bw(I,th/255);
%�����ʾ
out=J;
end