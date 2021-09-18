clc;
clear all;
close all;
N=9;
x=[1 0 1 1 0 0 1 0 1];
disp('Binary Information at transmitter');
disp(x);

%Representation of Transmitting binary information as digital signal
bit=[];
for n=1:N
    for xx=1:100
        se(xx)=x(n);
    end
    bit=[bit se];
end
t1=0.01:0.01:N;
subplot(3,1,1)
plot(t1,bit,'linewidth',2);
grid on;
axis([0 length(x) -0.5 1.5]);
ylabel('Amplitude (volt)');
xlabel('Time (sec)');
title('Transmitting Information as Digital Signal');


%Binary FSK Modulation
A=5;
f1=8;
f2=2;
t2=0.01:0.01:1;
%ss=length(t2);
fskm=[];
for i=1:N
    if x(i)==1
        y=A*cos(2*pi*f1*t2);
    else
        y=A*cos(2*pi*f2*t2);
    end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    fskm=[fskm y];
end
t3=.01:.01:N;
subplot(3,1,2)
plot(t3,fskm);
%axis([0, .1, -11, 11]);
grid on;
xlabel('Time(sec)');
ylabel('Amplitude (volt)');
title('Waveform for binary ASK Modulation corresponding binary information');


%Binary ASK Demodulation
mn=[];
for n=1:length(x)
    t=.01:.01:1;
    y1=cos(2*pi*f1*t);
    y2=cos(2*pi*f2*t);
    mm1=y1.*fskm(100*(n-(0.99)):100*n);
    mm2=y2.*fskm(100*(n-(0.99)):100*n);
    %t4=.01:.01:1;
    z1=trapz(t,mm1);
    z2=trapz(t,mm2);
    
    %disp(z);
    zz1=round((2*z1));
    zz2=round((2*z2));
    if(zz1>A/2)
        a=1;
    end
    if(zz2>A/2)
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

