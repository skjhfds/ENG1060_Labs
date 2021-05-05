function [a0,a1,r2] = linreg(x,y)
%
% [a0,a1,r2] = linreg(x,y)
% Written by: Harry Choi, 32464223
% Created on 06-May-2021
% The linreg (linear regression) function takes x and y arrays of values
% to find the line of best fit y = a0 + a1*x
% 
% Input arguments
% -----------------
%  x  array of x values
%  y  array of corresponding y values
%
% Output arguments
% -----------------
%  a0 constant of linear function of best fit
%  a1 gradient of linear function of best fit
%  r2 coefficient of determination
%
a1 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-(sum(x))^2);
a0 = mean(y)-a1*mean(x);
st = sum((y-mean(y)).^2);
r2 = (st-sum((y-(a0+a1*x)).^2))/st;