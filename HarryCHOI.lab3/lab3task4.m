% Harry Choi 32464223
% 26-Mar-2021
% Lab 3 Task 4
% Finding the minimum surface area and corresponding radius and height
% of a cone of volume 10m^3
clear; close all; clc

%creating data, guessing range of r values which incoporates minimum area
V = 10;
r = 0.01:0.01:1000;

%finding A and h values
[A,h] = cone(r,V);

%finding minimum A
[m,i] = min(A);

%printing answer
fprintf('Minimum A is %.2fm^2, given V=10m^3.\nCorresponding r is %.2fm and h is %.2fm.',m,r(i),h(i))