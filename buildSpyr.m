function coeff = buildSpyr(im, ht,filter)
load(filter,'lo0filt','hi0filt','lofilt','bfilts');

hi0 = corrDn(im, hi0filt,[1 1]);    
lo0 = corrDn(im, lo0filt,[1 1]);

temp = buildSpyrLevs(lo0, ht-1, lofilt, bfilts); 

coeff = [hi0  temp];

  
