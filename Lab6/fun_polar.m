function [x,y] = fun_polar(fhandle,N)
domT = 0:0.01:2*pi*N;
x = fhandle(domT).*cos(domT);
y = fhandle(domT).*sin(domT);