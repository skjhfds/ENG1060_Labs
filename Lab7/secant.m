function [root, iter] = secant(f,xi,xi_1, precision)
%
% [root, iter] = secant(f,xi,xi_1, precision)
% Written by: Harry Choi, 32464223
% Created on 30-Apr-2021
% The secant function takes a function handle f,
% initial guess for root, a value close to the initial guess
% and a precision
% to find a root of f to the precision using the secant method
% 
% Input arguments
% -----------------
%  f         function handle of equation to find root of
%  xi        initial guess for root
%  xi_1      previous guess for root
%  precision precision of root found
%
% Output arguments
% -----------------
%  root root found
%  iter number of iterations to find root to precision
%
iter = 0;
while abs(f(xi)) > precision
    iter = iter + 1;
    xi_new = xi - f(xi)*(xi-xi_1)/(f(xi)-f(xi_1));
    xi_1 = xi;
    xi = xi_new;
end
root = xi;