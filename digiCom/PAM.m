fc=10;
fm=1;
fs=300*fc;
t=0:1/fs:2/fm;

msg=sin(2*pi*fm*t);
carrier=square(2*pi*fc*t,30);
carrier(carrier<0)=0;

pam=msg.*carrier;
pam1=msg.*carrier;

%disp(pam);
for i=2:1:length(pam)
    if(pam(i)~=0)
        if(pam(i-1)~=0)
            pam(i)=pam(i-1);
        else
            pam(i)=pam(i);
        end
    else
        pam(i)=0;
    end
end

%disp(pam);
figure(1);
subplot(2,1,1)
plot(t,msg);
grid on;
subplot(2,1,2);
plot(t,carrier);
ylim([-0.2 1.2]);

figure(2);
subplot(2,1,1);
plot(t,pam1);
axis([0 2 -1.5 1.5]);
title('pam beofre mdification');
subplot(2,1,2);
plot(t,pam);
axis([0 2 -1.5 1.5]);
title('pam after modification');
