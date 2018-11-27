clc;
clear all;
close all;

original = imread('d_o120.jpeg');
mask = imread('d_mb120.jpg');
target = imread('d_t120.jpg');

original = rgb2gray(original);
target = rgb2gray(target);
mask = rgb2gray(mask);

original = imresize(original,[256,256]);
mask = imresize(mask,[256,256]);
target = imresize(target,[256 256]);
%[n,m]=size(original);
noise = wgn(256,256,0);

x = makeTexture(noise,target,original,mask);
figure;
imshow(x);
title('final');
x = imresize(x,[120,120]);
a = imread('d_im.jpg');
a = rgb2gray(a);
a = im2double(a);
%a(100:220,48:168)= x;
[n,m,d]=size(a);
disp(n);
disp(m);
disp(d);
for i=1:n
    for j=1:m
        if i>=48 && i<168 && j>=100 && j<220
            a(j,i)=x(j-99,i-47);
        end
    end
end
figure;
imshow(a);
            