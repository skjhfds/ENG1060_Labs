clear; clc; close all

T = 1;

kMax = 5;
domT = -1:0.0001:1;

k = 0:kMax;
F = @(t) 4*t;
testF = F(domT);

plot(domT,testF,'-b')