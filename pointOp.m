function out = pointOp(im,Y,X)
temp=interp1(X, Y, im(:), 'linear', 'extrap');
out = reshape(temp,size(im));

