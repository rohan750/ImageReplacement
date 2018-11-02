function blendedImage = blend(noise,original,mask )
noise_pry = gaussianPyramid(noise,5,0.2);
noise_pry = laplacianPyramid(noise_pry);

original_pry = gaussianPyramid(original,5,0.2);
original_pry = laplacianPyramid(original_pry);

mask_pry =  gaussianPyramid(mask,5,0.2);

blendedImage = blendPyramid(original_pry,noise_pry,mask_pry);

end

