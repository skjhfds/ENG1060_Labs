clc; clear; close all
f = @(x) -x^5 -3*x -3;
xl=-1
xu=5
xr = (f(xu)*xl-f(xl)*xu)/(f(xu)-f(xl))