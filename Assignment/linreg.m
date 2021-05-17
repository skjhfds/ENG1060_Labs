function [a0,a1,r2] = linreg(x,y)
%function [a0,a1,r2] = linreg(x,y)
%
%Written by Hannah Tay 32521987
%Date created: 5th May 2021
%
%
%takes a set of data (x,y) and finds the coefficients for a linear
%approximation y = a0 + a1 * x of the data
%
%inputs:
%x - first variable
%y - second variable
%
%outputs:
%a0 - y-intercept of linear approximation function
%a1 - gradient of linear approximation function
%r2 - coefficient of determination 

%function commands:
%defining variables for calculation of a0 and a1
n=length(x);
x_y = x.*y;
x_squared = x.^2;

%calculation of a1 and a0 (linear regression where y = a0 + a1 * x)
a1 = (n*sum(x_y)-sum(x)*sum(y))/(n*sum(x_squared)-(sum(x))^2);
a0 = mean(y)-a1*mean(x);

%defining variables for easier calculation of r2
Sr = sum((y-a0-a1.*x).^2);
St = sum((y-mean(y)).^2);

%finding the coefficient of determination, r2
r2 = (St-Sr)/St;
