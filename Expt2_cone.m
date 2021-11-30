clc;
close all;
clear all;

global fin %Here value of fin=0.2215;
%h=1; r=1; Cs=0.05; Xs=1; g=9.8;

h0=0.2;
tin=0;
tfin=0;
ts=0.02;
simt=30; %simulation time
for k=1:(simt/ts) %30/0.02 = 1500
    h1(k)=h0;
    if (k>0 && k<=300)
        fin = 0.2738;
    end
    
    if (k>300 && k<=600)
        fin = 0.3536;
    end
    
    if (k>600 && k<=1500)
        fin = 0.4472;
    end
    
    time(k)=tfin;
    tfin=tin+ts;
    finp(k)=fin;
    [t,h] = ode45(@Exp2b,[tin tfin],h0);
    h0=h(length(t),:);
    tin=tfin;
end
plot(time,h1);
hold on;
plot(time,finp,'r');
grid on