% ‘r’曲线颜色，‘lineWidth’曲线宽度
set(gca,'XLim',[1 100])% $x\in[1,100]$
set(gca,'Ylim',[1,100])% $y\in[1,100]$
figure(1)
clc,clear;
%% Sigmod
x2=-10:0.1:10;
y2=1./(1+exp(-x2));
plot(x2,y2,'r','lineWidth',2);
title('sigmod')
legend('y=1/1+e^{-x}')
xlabel('x轴')
ylabel('y轴')
grid on
%% Tanh
figure(2)
x3=-10:0.1:10;
y3=(exp(x3)-exp(-x3))./(exp(x3)+exp(-x3));
plot(x3,y3,'r','lineWidth',2)
title('tanh')
legend('y=(e^x-e^{-x})/(e^x+e^{-x})')
xlabel('x轴')
ylabel('y轴')
grid on
%% Relu
figure(3)
x4=-10:0.1:10;
y4=x4.*(x4>=0)+0.*(x4<0);
plot(x4,y4,'r','lineWidth',2);
title('Relu激活函数')
legend('y=x.*(x>=0)+0.*(x<0)')
xlabel('x轴')
ylabel('y轴')
grid on
%% ELU
figure(4)
x4=-10:0.1:10;
y4=x4.*(x4>=0)+(exp(x4)-1).*(x4<0);%α=1
plot(x4,y4,'r','lineWidth',2);
title('Elu激活函数')
legend('y=x.*(x>=0)+(exp(x)-1).*(x<0)')
xlabel('x轴')
ylabel('y轴')
grid on