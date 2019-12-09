function Output=irle(Input)
L=length(Input);
s=1;
k=1;
i=1;
while i<L
    if Input(i+1)>1
    while s<=Input(i+1)
        Output(k)=Input(i);
        s=s+1;
        k=k+1;
    end
    i=i+2;
    s=1;
    else
        Output(k) = Input(i);
        i = i + 1 ;
        k = k + 1 ;  
    end
end
if(Input(L)<2)
Output(k) = Input(L);
end