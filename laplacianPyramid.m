function LaplacianPyramid=laplacianPyramid(gaussiaPyrA)
levels=size(gaussiaPyrA,1);
LaplacianPyramid=cell(levels,1);
for i=levels:-1:1
    if i==levels
        %LaplacianPyramid{i,1}=im2double(gaussiaPyrA{levels,1});
        LaplacianPyramid{i,1}=gaussiaPyrA{levels,1};
    else
        [m,n,~]=size(gaussiaPyrA{i,1});
        temp=imresize(gaussiaPyrA{i+1,1},[m n]);
        %LaplacianPyramid{i,1}=im2double(gaussiaPyrA{i,1})-im2double(temp);
        LaplacianPyramid{i,1}=gaussiaPyrA{i,1}-temp;
    end
end
end
