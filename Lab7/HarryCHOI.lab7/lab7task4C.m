% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 4 Part C
close all; clc; clear
V02max = @(t) 0.1*sin(0.07*t).*t.^1.8+35;
% Part A
tV02 = 54.5;
f = @(t) V02max(t)-tV02;
tHours = falseposition(f,15,20,1e-4);
% Part B
dV02 = @(t) 0.007*t.^1.8.*cos(0.07*t) + 0.18*t.^0.8.*sin(0.07*t);
maxT = modisecant(dV02,31,0.05,1e-4);
% Part C
domt = 0:0.1:40;
% plot V02max function
plot(domt,V02max(domt),'-b');
title("VO2 Max against Hours Trained Weekly")
xlabel("Hours Trained Weekly")
ylabel("VO2 Max (mL/kg/min)")
hold on
% plot Tzekih current and max possible
plot(tHours,V02max(tHours),'dk')
plot(maxT, V02max(maxT),'dr')
legend('V02 Max function','Tzekih current V02','Maximum Possible V02','Location','best')