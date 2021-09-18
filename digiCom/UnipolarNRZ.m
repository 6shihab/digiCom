clc;
clear all;
close all;
N=10; %Number of bits
n=randi([0,1],1,N); %Random bit generation
disp(n)
tt=1:1:10;
subplot(2,1,1)
plot(tt,n);
axis([0,N,-1.5,1.5]);

%Signal Shaping
i=1;
t=0.01:0.01:length(n); 
y=[];
for j=1:N
    for i=1:100
        se(i)=n(j);
    end
    y=[y se];
end
subplot(2,1,2)
plot(t,y);
axis([0,N,-1.5,1.5]); %Axis set-up
grid on;
title("Unipolar NZR Signaling");