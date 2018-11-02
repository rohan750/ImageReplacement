function [img,finalpyrA]=matchPyramid(pyrA,pyrB)
levels=size(pyrA,1);
[~,~,thirdDimension] = size(pyrA{1,1});
A=cell(levels,1);
for l=1:levels
    for k = 1:thirdDimension
        A{l,1}(:,:,k)=imhistmatch(pyrA{l,1}(:,:,k),pyrB{l,1}(:,:,k));
    end
    %imshow(A{l,1},[]);
    %pause();
end
finalpyrA = A;
for i=levels-1:-1:1
    [m,n,~] = size(A{i,1});
    temp=imresize(A{i+1,1},[m n]);
    A{i,1}=A{i,1}+temp;
end
img=A{1,1};

end
