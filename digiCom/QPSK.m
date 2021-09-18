%QPSK waveform generation
clc; 
clear all; 
close all;
x=input('Enter Sequence');
% x=[1 1 0 1 1 0 1 0 1 1];
disp(x);

%Bits to polar
for i=1:length(x)
    if x(i)==1
        p(i)=1;
    else
        p(i)=-1;
    end
end
%NRZ polar line coder signal generation
t=0.01:0.02:length(x);
odd_ps=[];
for j=1:2:length(x)
    for xx=1:100
        pp(xx)= p(j);
    end
    odd_ps=[odd_ps pp];
end
figure(1);
subplot(211);
plot(t,odd_ps,'b');
title('Odd Positions PolarNRZ');

even_ps=[];
for j=2:2:length(x)
    for xx=1:100
        pp(xx)= p(j);
    end
    even_ps=[even_ps pp];
end
subplot(212);
plot(t,even_ps,'r');
title('Even Positions PolarNRZ');

%Carrier signals generation
c1=cos(2*pi*1*t);
c2=cos(2*pi*1*t+pi/2);

figure(2);
subplot(211);
plot(t,c1,'r');
title('Carrier Signal 1 (Cosine)');

subplot(212);
plot(t,c2,'b');
title('Carrier Signal 2 (Sine)');

%QPSK Wveform generation
r1=odd_ps.*c1;
r2=even_ps.*c2;

qpsk_sig=r1+r2;

figure(3);
subplot(311);
plot(t,r1,'b');
title('Odd_positions Modulated inphase with Cosine');
grid on;

subplot(312);
plot(t,r2,'r');
title('Even_positions Modulated 90 degree phase with Sine');
grid on;

subplot(313);
plot(t,qpsk_sig,'b');
title('QPSK Modulated');
grid on;