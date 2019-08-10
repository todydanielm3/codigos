function histograma(I,n,ps)
clear all
close all 

[h,w] = size(I);
n = length(I(:));
[nk rk] = hist(I(:), [0:255]);
stem(rk,nk);
ps=nk/n;

for i = 1:length(ps)
    sk(i) = sum(ps(1:i));
end

imshow(I)
for i=1:h
    for j=1:w
        Ih(i,j) = round(255*sk(I(i,j)+1));
    end
end
figure
imshow(uint8(Ih))
