% Harry Choi 32464223
% 23-Apr-2021
% Lab 6 Task 4 Step A
close all; clc; clear

T = 1;
domT = -T:0.0001:T;

f = @(t) 1.*(0<=t & t<=T) + -1.*(-T<=t & t<0);

plot(domT,f(domT))
title('Square wave f(t)')
xlabel('t')
ylabel('f(t)')
legend('f(t)','Location','best outside')