%Written by: Hannah Tay 32521987
%Date created: 19th May 2021

clc; clear; close all; 

dydt=@(t,y) y.*t.^3-1.5*y; %ODE
h=0.5; %step size
y0=1; %initial condition
tspan=[0 2]; %tspan

%solving analytically, plotted with increments of 0.01
y1=@(t) exp((t.^4)./4-1.5.*t);
t1=0:0.1:2;
plot(t1,y1(t1),'--')
hold on

%solving using Euler's method (step size 0.5)
[t2,y2]=euler(dydt,tspan,y0,h);
plot(t2,y2)

%solving using midpoint method (step size 0.5)
[t3,y3]=midpoint(dydt,tspan,y0,h);
plot(t3,y3)

%solving using ode45 (adaptive step size)
[t4,y4]=ode45(dydt,tspan,1);
plot(t4,y4)
title('solutions of an ODE using different methods')
xlabel('independent variable, t')
ylabel('dependent variable, y')
legend('analytical','Euler''s method','midpoint method','ode45','location','best')

fprintf('As the step size h is decreased, the midpoint method converges faster than\n')
fprintf('Euler''s method. This is because its procedure consists of a predictor and corrector\n')
fprintf('step, which makes the method more accurate.\n')