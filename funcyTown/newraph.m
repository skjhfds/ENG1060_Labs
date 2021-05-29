function [root, iter] = newraph(f,df,xi, precision)
%
% [root, iter] = newraph(f,df,xi, precision)
% Written by: Harry Choi, 32464223
% Created on 30-Apr-2021
% The newraph function takes a function handle f,
% function handle of the derivative of f df,
% initial guess for root and a precision
% to find a root of f to the precision using the Newton Raphson method
% 
% Input arguments
% -----------------
%  f         function handle of equation to find root of
%  df        function handle of derivative of f
%  xi        initial guess for root
%  precision precision of root found
%
% Output arguments
% -----------------
%  root root found
%  iter number of iterations to find root to precision
%
iter = 0;
if df(xi)==0
    error('xi is Stationary point!')
    return
end
while abs(f(xi)) > precision
    iter = iter + 1;
    xi = xi - f(xi)/df(xi);
end
root = xi;