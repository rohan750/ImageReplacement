function out = reconSpyr(coeff, filter)
load(filter,'lo0filt','hi0filt','lofilt','bfilts');

res = reconSpyrLevs(coeff(2:length(coeff)),lofilt, bfilts);
temp = upConv(res, lo0filt,[1 1]);

highpass = upConv( coeff{1}, hi0filt,[1 1]);

out=highpass+temp;

 
