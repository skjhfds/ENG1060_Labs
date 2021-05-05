% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 4 Part B
close all; clc; clear
V02max = @(t) 0.1*sin(0.07*t).*t.^1.8+35;
% Part A
tV02 = 54.5;
f = @(t) V02max(t)-tV02;
tHours = falseposition(f,15,20,1e-4);
% Part B
dV02 = @(t) 0.007*t.^1.8.*cos(0.07*t) + 0.18*t.^0.8.*sin(0.07*t);
maxT = modisecant(dV02,31,0.05,1e-4);
fprintf('The maximum VO2 Tzekih can achieve is %.4f and he will need to do %.4f more hours than he is currently doing.',V02max(maxT),maxT-tHours)
