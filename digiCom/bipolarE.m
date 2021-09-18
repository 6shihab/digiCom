clc;
clear all;
close all;
N=10; %Number of bits
n=[1 0 1 1 1 0 0 1 0 1]; %Random bit generation

%Mapping Function
for m=1:N
    if n(m)==1
        nn(m)=1;
    else
        nn(m)=0;
    end
end
%Signal Shaping
i=1;
y=[];
cou=0;
t=0.01:0.01:N; 
for j=1:N
    if nn(j)==1
        cou=cou+1;
    end
    for xx=1:50
        if rem(cou,2)==1
            pp(xx)= nn(j);
        else
            pp(xx)= -nn(j);
        end
    end
    for xx=51:100
        pp(xx)= 0;
    end
    y=[y pp];
end
plot(t,y);
axis([0,N,-1.5,1.5]); %Axis set-up
grid on;
title('Unipolar NZR Signaling');