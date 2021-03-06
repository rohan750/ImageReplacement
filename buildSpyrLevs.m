function [coeff] = buildSpyrLevs(lo0,ht,lofilt,bfilts)
if (ht <= 1)
    % Reach the lowpass component
    coeff={lo0}; 
else

  nbands=length(bfilts);
  bands = cell(1,nbands);

  % Orientation bandpass
  for i = 1:nbands
    bands{i}=corrDn(lo0, bfilts{i},[1 1]);
  end
  % downsample by 2 along x and y dimension
  lo = corrDn(lo0, lofilt, [2 2]);
    
  % Recursive Calling
  temp = buildSpyrLevs(lo, ht-1, lofilt, bfilts);
  coeff=[{bands} temp];
end
