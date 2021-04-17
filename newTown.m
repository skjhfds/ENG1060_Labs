function [Gf,Hf,f,nx,ny]=newTown(x,y,c)
fx = x/(8*sqrt(x^2+c^2))-(c-x-y)/(2*sqrt((c-x-y)^2+c^2));
fy = y/(5*sqrt(y^2+c^2))-(c-x-y)/(2*sqrt((c-x-y)^2+c^2));
Gf = [fx;fy];
fxx = c^2/(8*(x^2+c^2)^(3/2)) + 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
fyy = c^2/(5*(y^2+c^2)^(3/2)) + 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
fxy = 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
Hf = [fxx,fxy;fxy,fyy];
n = [x;y] - inv(Hf)*Gf;
nx = n(1); ny = n(2);
f=sqrt(x^2+c^2)/8 + sqrt(y^2+c^2)/5 + sqrt((c-x-y)^2+c^2)/2;