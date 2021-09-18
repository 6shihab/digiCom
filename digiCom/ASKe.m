%ASK ........................................
clc;
clear all;
close all;
N=9;
x=[1 0 1 1 0 0 1 1 0];
disp('Binary Information at transmitter');
disp(x);

bit=[];
for n=1:N
    for xx=1:100
        se(xx)=x(n);
    end
    bit=[bit se];
end
t1=0.01:0.01:length(x);
subplot(3,1,1)
plot(t1,bit,'linewidth',2);
grid on;
axis([0 length(x) -0.5 1.5]);
ylabel('Amplitude (volt)');
xlabel('Time (sec)');
title('Transmitting Information as Digital Signal');


%Binary ASK Modulation
A1=10;
A2=5;
f=10;
t2=0.01:0.01:1;
%ss=length(t2);
ask=[];
for i=1:N
    if x(i)==1
        y=A1*cos(2*pi*f*t2);
    else
        y=A2*cos(2*pi*f*t2);
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    ask=[ask y];
end
t3=0.01:0.01:N;
subplot(3,1,2)
plot(t3,ask);
%axis([0, .1, -11, 11]);
grid on;
xlabel('Time(sec)');
ylabel('Amplitude (volt)');
title('Waveform for binary ASK Modulation corresponding binary information');


%Binary ASK Demodulation
mn=[];
for n=1:length(x)
    t=0.01:0.01:1;
    y=cos(2*pi*f*t);
    mm=y.*ask(100*(n-0.99):100*n);
    z=trapz(t,mm);
    disp(z);
    zz=round((2*z));
    if(zz>7.5)
        a=1;
    else
        a=0;
    end
    mn=[mn a];
end
disp('Binary Information at Receiver');
disp(mn);



%Represntation of Binary data into Digital signal
bit=[];
for n=1:length(mn)
    for jj=1:100
        se(jj)=mn(n);
    end
    bit=[bit se];
end
t4=.01:.01:N;
subplot(3,1,3)
plot(t4,bit,'linewidth',2);
grid on;
axis([0 length(mn) -0.5 1.5]);
xlabel('Time(sec)');
ylabel('Amplitude (volt)');
title('Received information as Digital Signal');
