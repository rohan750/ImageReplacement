function out = upConv(im,filt,step)
stop = step .* size(im);
tmp = zeros(stop);
tmp(1:step(1):stop(1),1:step(2):stop(2)) = im;

% Convolution
out=imfilter(tmp,filt,'circular');
