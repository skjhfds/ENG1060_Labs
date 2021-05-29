function [t,y] = euler(dydt,tspan,y0,h)
%function [t,y] = euler(dydt,tspan,y0,h)
%
%Written by: Hannah Tay 32521987
%Date created: 19th May 2021
%
%solves an ODE using Euler's method
%
%inputs:
%dydt - function handle of the ODE (f(t,y))
%tspan - [initial_value, final_value] of independent variable 
%y0 - initial value of dependent variable
%h - step size
%
%outputs:
%t - vector of independent variable
%y - vector of solution for dependent variable

%check if the function increases
if tspan(2)<tspan(1)
    error('please enter a valid tspan (must increase)')
end

t=(tspan(1):h:tspan(2))';
n=length(t);
%ensuring range goes to tspan(2)
if t(n)<tspan(2)
    t(n+1)=tspan(2);
    n=n+1;
end

%performing Euler's method
y=y0*ones(n,1); %pre-allocating
for i=1:n-1
    y(i+1)=y(i)+dydt(t(i),y(i))*(t(i+1)-t(i));
end