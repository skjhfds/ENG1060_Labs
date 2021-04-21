clear;clc;close all
f = @(x) x.^(1./x);
%plot(1:0.001:50,f(1:0.001:50))
[max_value, index] = mymax(f);
