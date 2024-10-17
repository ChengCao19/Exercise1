%% 一种matlab训练神经网络的GPU崩溃解决办法
%windows+R打开
%输入cmd进入控制台
%输入nvidia-smi，查看GPU进程号
%形如：
% -----------------------------------------------------------------------------+
% | Processes:                                                                  |
% |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
% |        ID   ID                                                   Usage      |
% |=============================================================================|
% |    0   N/A  N/A     13000    C+G   ...tlab\bin\win64\MATLAB.exe    N/A      |
%13000为进程号
%输入：
%taskkill -PID 进程号 -F 
%此时matlab关闭，重启即可

%% 一种解决matlab初始化时间长的方法
%选中matlab快捷方式，右键，点击属性
%将目标进行如下修改：
%D:\Matlab\bin\matlab.exe -c "D:\Matlab\Matlab 2021b 64bit\Crack\license_standalone.lic"
%其中，-c前后要有空格，用英文双引号强调matlab的许可证书路径以及许可证名称
%重启
%此外还可以在环境变量中进行配置
