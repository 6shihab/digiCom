clc;
clear all;
close all;
N=10; %Number of bits
n=[1 0 1 1 1 0 0 1 0 1]; %Random bit generation
disp(n);
%Mapping Function
for m=1:N
    if n(m)==1
        nn(m)=1;
    else
        nn(m)=-1;
    end
end
%Signal Shaping
i=1;
y=[];
t=.01:0.01:N; %100 Times duration set up for a single binary bit
for j=1:N %Indexing set-up for time duration
    for xx=1:50
        pp(xx)= nn(j);
    end
    for xx=51:100
        pp(xx)= -nn(j);
    end
    y=[y pp];
end
plot(t,y);
axis([0,N,-1.5,1.5]); %Axis set-up
grid on;
title("Manchester Coding");
