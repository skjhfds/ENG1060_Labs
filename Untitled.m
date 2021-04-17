clc; clear all; close all
x = 55;
y = 33;
c = 100;

for i=1:5
    fx = x/(8*sqrt(x^2+c^2))-(c-x-y)/(2*sqrt((c-x-y)^2+c^2));
    fy = y/(5*sqrt(y^2+c^2))-(c-x-y)/(2*sqrt((c-x-y)^2+c^2));
    Gf = [fx;fy];
    fxx = c^2/(8*(x^2+c^2)^(3/2)) + 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
    fyy = c^2/(5*(y^2+c^2)^(3/2)) + 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
    fxy = 1/(2*sqrt((c-x-y)^2+c^2)) - (c-x-y)^2/(2*((c-x-y)^2+c^2)^(3/2));
    Hf = [fxx,fxy;fxy,fyy];
    n = [x;y] - inv(Hf)*Gf;
    
    x = n(1); y = n(2);
    
    f=sqrt(x^2+c^2)/8 + sqrt(y^2+c^2)/5 + sqrt((c-x-y)^2+c^2)/2;
    
    fprintf('Step:%.0f\n',i)    
    fprintf('(x%.0f, y%.0f) = (%f, %f)\n',[i,i,n'])
    fprintf('f(x%.0f, y%.0f) = %f\n',[i,i,f])
    fprintf('Gradient of f:[%d, %d]\n',Gf)
    fprintf('Hessian matrix:[%f, %f; %f, %f]\n\n',Hf)
end