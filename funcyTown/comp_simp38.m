function I = comp_simp38(f,a,b,n)
%
% I = comp_simp38(f,a,b,n)
% Written by: Harry Choi, 32464223
% Created on 13-May-2021
% The comp_simp38 function takes a function handle, start and end points,
% as well as number of points to use to find the definite integral of
% the function from a to b using the composite Simpson's 3/8 rule.
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

% error checking

if (n < 4) || (rem(n-1,3) ~= 0)
    error('Inappropriate number of points for integration')
end

% creating x vector and determining width
h = (b-a)/(n-1);
x = linspace(a,b,n);
 
%Evaluating integral
sum_1 = 3*sum(f(x(2:3:end-2)));
sum_2 = 3*sum(f(x(3:3:end-1)));
sum_3 = 2*sum(f(x(4:3:end-3)));

I = 3*h/8*(f(a) + sum_1 + sum_2 + sum_3 + f(b));