function GaussianPyramid =gaussianPyramid(A,levels,sigma)
GaussianPyramid=cell(levels,1);
for i=1:levels
    if i==1
        GaussianPyramid{i,1}=im2double(A);
    else
    temp = gaussian_filtering(GaussianPyramid{i-1,1},sigma);
    %GaussianPyramid{i,1}=temp(1:2:end,1:2:end,:);
    GaussianPyramid{i,1} = imresize(temp,0.5);
    end
end
