function outputImage = makeTexture(noise,target,original,mask)
noise = im2double(noise);
target = im2double(target);
original = im2double(original);
mask = im2double(mask);
%original= blend(mean(target), original, mask); 
levels = 4;

noise = imhistmatch(noise,target);
%noise =(noise+ original+mask)/3; 
noise = blend(noise,original,mask);
figure;
imshow(noise);
title('before loop');
n=zeros(size(noise));
analysis_pyr = buildSpyr(target,levels+1,'sp3.mat');
for iterations = 1:10
    %disp(iterations);
    synthesis_pyr  = buildSpyr(noise,levels+1,'sp3.mat');
    n = matchHistogram(analysis_pyr,synthesis_pyr);
    n = imhistmatch(n,target); 
    n = imresize(n,size(original));
    n = blend(n,original,mask);
    nc = sum(sum(n-noise));
    disp(nc);
    noise=n;
    %figure;
    %imshow(noise);
    %title(num2str(iterations));
    %pause();
end
outputImage = noise;
%figure;
%noise=imresize(noise,[100,100]);
%imshow(noise);
%title('final');
end

