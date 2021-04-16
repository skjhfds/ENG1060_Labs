function [x1,x2,discriminant] = my_quadratic(a,b,c)
%
% [x1,x2,discriminant] = my_quadratic(a,b,c)
% Written by: Harry Choi, 32464223
% Created on 15-Apr-2021
% The my_quadratic function takes a quadratic equation's coefficients
% and calculates its roots and discriminant
% 
% Input arguments
% -----------------
%  a coefficient of x^2
%  b coefficient of x
%  c constant
%
% Output arguments
% -----------------
%           x1 first root
%           x2 second root
% discriminant discriminant
%
    discriminant = b^2 - 4*a*c;
    x1 = (-b+sqrt(discriminant))/(2*a);
    x2 = (-b-sqrt(discriminant))/(2*a);
end