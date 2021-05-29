function [root, iter] = bisection(f,xl,xu, precision)
%
% [root, iter] = bisection(f,xl,xu, precision)
% Written by: Harry Choi, 32464223
% Created on 30-Apr-2021
% The bisection function takes a function handle f,
% x upper and lower brackets, and a precision
% to find a root of f between the brackets to the precision
% using the bisection method
% 
% Input arguments
% -----------------
%  f         function handle of equation to find root of
%  xl        the lower bracket of the root
%  xu        the upper bracket of the root
%  precision precision of root found
%
% Output arguments
% -----------------
%  root root found
%  iter number of iterations to find root to precision
%
fLower = f(xl);
if fLower*f(xu)>0
    fprintf('\nIncorrect bracketing.\n')
    return
end
%first guess for root can be as close to precision as f(xl)
fRoot = fLower;
iter = 0;
while abs(fRoot) > precision
    iter = iter + 1;
    root = 0.5*(xl + xu);
    fRoot = f(root);
    if fLower*fRoot>0
        xl = root;
        fLower = fRoot;
    else
        xu = root;
    end
end