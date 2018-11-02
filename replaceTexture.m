clc;
clear all;
close all;

original = imread('wall.jpg');
mask = imread('wall_mask.jpg');
target = imread('brick.JPG');

original = rgb2gray(original);
target = rgb2gray(target);
mask = rgb2gray(mask);

original = imresize(original,[256,256]);
mask = imresize(mask,[256,256]);
target = imresize(target,[256 256]);
noise = wgn(256,256,0);

x = makeTexture(noise,target,original,mask);

x = imresize(x,[534,800]);
a = imread('wall.jpg');
a = rgb2gray(a);
a = im2double(a);
a = x;
%a(120:120+255,215:215+499)= x;
