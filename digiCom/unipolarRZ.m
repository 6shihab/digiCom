% unipolar RZ

clc;
clear all;
close all;
N=10; %Number of bits
n=randi([0,1],1,N); %Random bit generation
disp(n)
%Signal Shaping
i=1;
y=[];
t=0.01:0.01:N; %100 Times duration set up for a single binary bit
for j=1:N %Indexing set-up for time duration
    for xx=1:50
        pp(xx)= n(j);
    end
    for xx=51:100
        pp(xx)= 0;
    end
    y=[y pp];
end
plot(t,y);
axis([0,N,-1.5,1.5]); %Axis set-up
grid on;
title("Unipolar NZR Signaling");