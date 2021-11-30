function dh = coni(t,h)

global fin
teta=0.5;
b=0.5;
x=1;
%dh = zeros(1,1); % a column vector
dh = (fin-(b*x*sqrt(h)))/(pi*tan(teta)^2*h^2);