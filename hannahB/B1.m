clc; clear; close all;

%false position method
f = @(x) x*sin(x)-4*x^2+30;
[y,iter,xu_change,xl_change]=falseposition(f,-10,1,10^-8);

%xu_change is the number of times that xu changes (required value)