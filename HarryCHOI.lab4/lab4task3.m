% Harry Choi 32464223
% 1-april-2021
% Lab 4 Task 3
close all; clc; clear

%import data
T = importdata('temperatures.txt');

%plot temp against time
plot(T,'rd')
title('Temperature against Time')
xlabel('Time in days')
ylabel('Temperature in Celsius')

%create filtering logical
L = logical(T>45|T<0);
L([5,13,34,40,42])=1;

%plot filtered temp against time
figure
plot(T(~L),'bo')
title('Filtered Temperature against Time')
xlabel('Time in days')
ylabel('Temperature in Celsius')
