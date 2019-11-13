function [x,y]=coordPointsMax(A,x,y,n)

for i=1:4    
    max = A(y(i), x(i));
    xmax = x(i);
    ymax = y(i);
    
    for k=y(i)-n:y(i)+n
        for j=x(i)-n:x(i)+n
            if max<A(k,j)
                
                max=A(k,j);
                xmax=j;
                ymax=k;
                
            end
        end
    end
    x(i) = xmax;
    y(i) = ymax;    
end

end
