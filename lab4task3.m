% Harry Choi 32464223
% 1-april-2021
% Lab 4 Task 2
close all; clc; clear
T = importdata('temperatures.txt');
%plot temp against time
subplot(1,2,1)
plot(T,'rd')
title('Temperature against Time')
xlabel('Time in days')
ylabel('Temperature in Celsius')

L = logical(T>45|T<0);
T([5,13,34,40,42]);
subplot(1,2,2)
plot(T,'rd')
title('Filtered Temperature against Time')
xlabel('Time in days')
ylabel('Temperature in Celsius')
close all