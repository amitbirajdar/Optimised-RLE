function Output = rle(Input)
Output = 0 ;
L=length(Input);
j=1;
k=1;
i=1;
p=0;
while 1
    comp=1;
    for j=j:L-1
        
         if Input(j)==Input(j+1)
            comp=comp+1;
            p = 1 ;
         elseif (p == 1)
            break
         else
            Output(k) = Input(j);
            k = k + 1 ;
            j = j + 1 ;
            break
         end
    end
    if p==1
        
        Output(k+1)=comp;
        Output(k)=Input(j);
        k=k+2;
        j = j+1;
        p = 0 ;
    end
    
        if j==L && Input(j-1)==Input(j) 
            break
        end
      
       
        if j==L 
            Output(k)=Input(j);
             break
        end
end 
