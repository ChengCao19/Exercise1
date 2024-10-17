imagePath = 'D:\Aleaf\resultimage\';   
imageFiles = dir(imagePath); %%读取目录文件下的所有图片文件  
numFiles = length(imageFiles);%%获取图片的数量  
parfor i=3:numFiles   %matlab 并行 其实和for一个用法               
    j = i-2;  
    disp(j); %%disp（） 函数直接将内容输出在Matlab命令窗口中  
    imageFile = strcat(imagePath,imageFiles(i).name); %%strcat()函数经常出现在批量处理的时候，这个时候我们需要用到for循环，然后这个函数能够让变量和路径产生一些关系，这个时候我们就可以对其进行批量处理。
    A = imread(imageFile); %%读入图片  
    B = imresize(A,[400 500]); %%修改图片尺寸  
    imwrite(B,imageFile); %%保存图片        
end 