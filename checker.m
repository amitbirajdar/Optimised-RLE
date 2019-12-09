function flag = checker(Input1,Input2)
[row1 col1] = size(Input1);
[row2 col2] = size(Input2);
flag = 0 ;
row = row1 ;
col = col2 ;
if(row1>row2)
row = row2;
end
if(col2>col1)
col = col1;
end
for i = 1:row
for j = 1:col
if(Input1(i,j)~=Input2(i,j))
flag = 1 ;
break;
end
end

end
end