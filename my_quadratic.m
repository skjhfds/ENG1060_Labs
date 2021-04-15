function [x1,x2,discriminant] = my_quadratic(a,b,c)
    discriminant = b^2 - 4*a*c;
    x1 = (-b+sqrt(discriminant))/(2*a);
    x2 = (-b-sqrt(discriminant))/(2*a);
end