clear all;
lencc = csvread('encodedlen.csv');
eco = imread('encoded.jpeg');
[row col] = size(eco);
for i = 1:row
    column = eco(i,1:lencc(i,1));
    Decoded(i,:) = irle(column(:));
    
end

figure
imshow(logical(Decoded))
imwrite('decoded4.jpeg')