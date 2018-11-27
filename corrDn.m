function out = corrDn(im, filt, step)
filt = rot90(filt,2);
tmp=imfilter(im,filt,'circular');

% Downsampling
out = tmp(1:step(1):size(im,1), 1:step(2):size(im,2));
