function [root, iter] = modisecant(f,xi,pert, precision)
%
% [root, iter] = modisecant(f,xi,pert, precision)
% Written by: Harry Choi, 32464223
% Created on 30-Apr-2021
% The modisecant function takes a function handle f,
% initial guess for root, a small increment and a precision
% to find a root of f to the precision
% using the modified secant method
% 
% Input arguments
% -----------------
%  f         function handle of equation to find root of
%  xi        initial guess for root
%  pert      a small increment inexplicably named pert
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
    xi = xi - f(xi)*pert/(f(xi+pert)-f(xi));
end
root = xi;