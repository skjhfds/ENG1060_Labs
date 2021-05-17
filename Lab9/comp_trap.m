function I = comp_trap(f,a,b,n)
%
% function I = comp_trap(f,a,b,n)
% Written by: Harry Choi, 32464223
% Created on 13-May-2021
% The comp_trap function takes a function handle, start and end points,
% as well as number of points to use to find the definite integral of
% the function from a to b using the composite trapezoidal rule.
%
% Input arguments
% -----------------
%   f function handle of integrand
%   a start point of integral
%   b end  point of integral
%   n number of points to use in Simpson's 3/8 rule
% Output arguments
% -----------------
%   I definite integral of f between a and b
%


h = (b-a)/(n-1);
x = linspace(a,b,n);
I = h/2*(f(a) + 2*sum(f(x(2:end-1))) + f(b));