%Step response of non interacting system
%Diameter=92mm ; Area=6646 mm^2;
clc
clear all
close all

a=6646;
r1_ni = 0.00324;
r2_ni = 0.00702;

tau1_ni = 21.53;
tau2_ni = 46.64;

%step response of non interacting system
r1_int = 0.0126;
r2_int = 0.00774;

tau1_int = 83.10;
tau2_int = 51.44;

%Single-Capacity process
r = 0.00486
tau = a*r;
sys = tf(r*2777.8,[tau 1])

sys1 = tf(1,[tau1_ni 1]);
sys2 = tf(r2_ni*2777.8,[tau2_ni 1]);

%Multi-Capacity process
sys_NI = series(sys1,sys2)
sys_I = tf(r2_int*2777.8,[tau1_int*tau2_int tau1_int+tau2_int+a*r2_int 1])

step(sys, 'r')
hold on
step(sys_NI, 'b')
hold on
step(sys_I, 'g')