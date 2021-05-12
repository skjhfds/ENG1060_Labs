function [F, V, a0, a1, r2] = LinRegrSGR(x, y, n)
%
% [F, V, a0, a1, r2] = LinRegrSGR(x, y, n)
% Written by: Harry Choi, 32464223
% Created on 06-May-2021
% The LinRegrSGR (linear regression of saturation growth rate) function
% takes x and y arrays of values and index n
% to find the line of best fit y = a0 + a1*x
% No one knows why it starts with a capital letter
% 
% Input arguments
% -----------------
%  x  array of x values
%  y  array of corresponding y values
%  n  a constant index of the saturation growth rate
%
% Output arguments
% -----------------
%  F  constant
%  V  constant
%  a0 constant
%  a1 constant
%  r2 coefficient of determination
%
nx = x.^(-n);
ny = y.^(-1);
p = polyfit(nx, ny, 1);
a0 = p(2);
a1 = p(1);
F = 1/a0;
V = (a1*F)^(1/n);
% linear r2
st = sum((ny - mean(ny)).^2);
sr = sum((ny-(a0+a1*nx)).^2);
r2 = (st-sr)/st;
