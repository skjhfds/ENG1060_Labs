% Harry Choi 32464223
% 26-Mar-2021
% Lab 3 Task 5
% Calculates hyperbolic tangents using e^x approximated by 6 terms of
% Taylor/Maclaurin series then compares them to MATLAB's built in
% hyperbolic tangent function
clear; close all; clc

%create data
x = [1, 5, 25, 60];

%calculate my tanh values using tm6() function
tanh_approx = (tm6(x)-tm6(-x))./(tm6(x)+tm6(-x));
tanh_real = tanh(x);
error = abs(tanh_approx-tanh_real);

%print
%I changed the fprintf to make it more readable by having values of
%constant width
fprintf("x: %5.2f, Approximated tanh: %5.2f, MATLAB's tanh: %5.2f, Absolute error: %5.2f\n",[x;tanh_approx;tanh_real;error])