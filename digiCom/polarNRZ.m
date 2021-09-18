function [y]=polarNRZ(n,N)
for m=1:2:N
    if n(m)==1
        nn(m)=1;
    else
        nn(m)=-1;
    end
end
%Signal Shaping
y=[];
for j=1:2:N
    for xx=1:100
        pp(xx)= nn(j);
    end
    y=[y pp];
end
end
