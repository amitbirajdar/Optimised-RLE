clc;
clear all;
Input = imread('C:\Users\Harsh\Desktop\rle signchange\1.jpg');
[row col dep ] = size(Input);
if(dep>1)
Input = rgb2gray(Input);
end

Binary = imbinarize(Input(:,:,1));

% a = 0;
% th = 50;
% 
% while(a==0)
%     r1 = 0;
%     r2 = 0;
%     c1 = 0;
%     c2 = 0;
%     for i = 1:row
%         for j = 1:col
%             if(double(Input(i,j))<=th)
%                 r1 = r1 + double(Input(i,j));
%                 c1 = c1+1;
%             else
%                 r2 = r2 + double(Input(i,j));
%                 c2 = c2 + 1;
%             end
%         end
%     end
%    
%     u1 = r1/c1;
%     u2 = r2/c2;
%     th1 = (u1+u2)/2;
%     if (abs(th1-th)>=0.1)
%         th = th1;
%     else
%         a = 1;
%     end
% end
    




% for i = 1:row
%     for j = 1:col
%         if(Input(i,j)>th)
%             Binary(i,j) = 1;
%         else
%             Binary(i,j) = 0;
%         end
%     end
% end
% 


imshow(Binary);
% encoding
c1 = 0;
c2 = 0;
if(row>=col)
Binary = Binary';
[row col ] = size(Binary);
c1 = 1;
end
Binary2 = signchange(Binary);
flag = checker(Binary,Binary2);
if(flag==1)
c2 = 1 ;
Binary = Binary2;
[row col ] = size(Binary);
end
for i = 1:row
    column = Binary(i,:);
    Encoded = rle(column(:));
    [encr encc] = size(Encoded);
    eco(i,1:encc) = Encoded(1,:);
    lencc(i,1) = encc;
    
end


for i = 1:row
    column = eco(i,1:lencc(i,1));
    Decoded(i,:) = irle(column(:));
    
end


if( c1==1 && c2==0)
    Binary = Binary';
    Decoded = Decoded';
    [row col ] = size(Binary);

end
if( c2==1 && c1==0)
    Binary = Binary';
    Decoded = Decoded';
    [row col ] = size(Binary);

end
figure
imshow(Decoded)
csvwrite('C:\Users\Harsh\Desktop\rle signchange\RLE2\encodedlen1.csv',lencc)
imwrite(Binary,'C:\Users\Harsh\Desktop\rle signchange\RLE2\input1.jpeg')
imwrite(Decoded,'C:\Users\Harsh\Desktop\rle signchange\RLE2\decoded1.jpeg')
imwrite(uint16(eco),'C:\Users\Harsh\Desktop\rle signchange\RLE2\encoded1.jpeg','BitDepth',12);
Ratio = numel(eco)/numel(Binary);

Ratio 
rmse = 0 ;
for i =1: row
for j= 1:col
    rmse = rmse + (Binary(i,j)-Decoded(i,j)).^2;
end

end

rmse
	
	
	
