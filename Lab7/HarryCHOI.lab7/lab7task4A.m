% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 4 Part A
close all; clc; clear
V02max = @(t) 0.1*sin(0.07*t).*t.^1.8+35;

domt = 0:0.1:40;
tV02 = 54.5;
f = @(t) V02max(t)-tV02;
plot(domt,f(domt));
title("VO2 Max - Tzekih's V02 Max against Hours Trained Weekly")
xlabel("Hours Trained Weekly")
ylabel("VO2 Max - Tzekih's V02 Max (mL/kg/min)")
% 15 and 20 hours appear to bracket the root
fprintf('Based on function used, Tzekih trained %g hours',falseposition(f,15,20,1e-4))
% The past method involved finding V02max values of known training times
% (0.5 hours apart) that bracketed Tzekih's V02max then the time which
% produced the closest V02max was taken as the answer.
%
% This method can only be precise to 0.5 hours, where as the
% false position method can be precise to any value (1e-4 in this case)