%Written by: Hannah Tay 32521987
%Date created: 19th May 2021

clc; clear; close all; 

dydx=@(x,y) exp(y.*sin(x)+cos(y))./(4*x.*y); %ODE
y0=1.6; %initial condition
xspan1=20:0.01:70; %xspan for ode45
xspan2=[20 70]; %xspan for midpoint
h=[1 0.5 0.1]; %step sizes

%using ode45 to solve, plotting with a resolution of 0.001
[x1,y1]=ode45(dydx,xspan1,y0);
plot(x1,y1)
hold on

%using midpoint method to solve with various values of h, plotting
for i=1:3
    [x2,y2]=midpoint(dydx,xspan2,y0,h(i));
    plot(x2,y2)
end
title('solving an ODE using the midpoint method (comparing to the analytical solution)')
xlabel('independent variable, x')
ylabel('dependent variable, y')

%legend
L=strings(1,4);
L(1)='ode45';
for i=2:4
    L(i)=sprintf('midpoint method (h=%g)',h(i-1));
end
legend(L,'location','best')

%optional printing :)
fprintf('Decreasing the step size produces a result closer to the ode45 solution.\n')