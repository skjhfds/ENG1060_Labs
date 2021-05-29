function I = comp_simp13(f,a,b,n)
%
% I = comp_simp13(f,a,b,n)
% Written by: Harry Choi, 32464223
% Created on 13-May-2021
% The comp_simp13 function takes a function handle, start and end points,
% as well as number of points to use to find the definite integral of
% the function from a to b using the composite Simpson's 1/3 rule.
% 
% Input arguments
% -----------------
%   f function handle of integrand
%   a start point of integral
%   b end  point of integral
%   n number of points to use in Simpson's 1/3 rule
% Output arguments
% -----------------
%   I definite integral of f between a and b
%

% error checking
if (n < 3) || (rem(n,2) == 0)
    error('Inappropriate number of points for integration')
end
 
% creating x vector and determining width
h = (b-a)/(n-1);
x = linspace(a,b,n);
 
%Evaluating integral
even_sum = 4*sum(f(x(2:2:end-1)));
odd_sum = 2*sum(f(x(3:2:end-2)));
I = h/3*(f(a) + even_sum + odd_sum + f(b));