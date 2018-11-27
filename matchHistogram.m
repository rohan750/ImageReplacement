function outImage = matchHistogram(pyrA,pyrB)
tempA = pyrA{1,1};
tempB = pyrB{1,1};
A{1,1} = imhistmatch(tempA,tempB);

for i=2:length(pyrA)-1
    for j=1:4
        A{i}{j} = imhistmatch(pyrA{i}{j},pyrB{i}{j});
    end
end
A{length(pyrA)} = imhistmatch(pyrA{length(pyrA)},pyrB{length(pyrB)});

outImage = reconSpyr(A,'sp3.mat');
end
