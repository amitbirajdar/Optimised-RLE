function Output = signchange(Input)
[row col ] = size(Input);
rowcomp = 0 ;
colcomp = 0 ;
for i = 1:row
for j = 1:col-1
if(Input(i,j)~= Input(i,j+1))
rowcomp=rowcomp+1;
end
end
end

for i = 1:col
for j = 1:row-1
if(Input(j,i)~= Input(j+1,i))
colcomp=colcomp+1;
end
end
end

if(rowcomp>colcomp)
Output = Input';
else
    Output = Input;
end

