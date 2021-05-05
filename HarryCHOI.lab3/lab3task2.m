%Harry Choi
%25-Mar-2021
%Lab 3 Task 2
clear; close all; clc
%create data to plot
theta = linspace(-4*pi,4*pi,1000);
r = (sin(1.2*theta)).^2 + (cos(6*theta)).^3;
x = r.*cos(theta);
y = r.*sin(theta);
%plot x y against theta together
subplot(2,1,1)
plot(theta, x)
hold on
plot(theta, y)
title("x and y against theta")
xlabel("theta")
ylabel("coordinates")
legend("x = r cos(theta)","y = r sin(theta)","location","bestoutside")
%plot y against x
subplot(2,1,2)
plot(x,y,"Color","[0.0353, 0.6941, 0.8588]")
title("Snowflake (y against x)")
xlabel("x")
ylabel("y")
axis square