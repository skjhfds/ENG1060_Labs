function I = comp_trap_vector(x,y)
%function I = comp_trap_vector(x,y)
%
%Written by: Hannah Tay 32521987
%Date created: 12th May 2021
%
%uses the composite composite trapezoidal rule to approximate the definite integral of a
%given function f between the given limits of integration
%
%inputs:
%x - x-values of data set
%y - y-values of data set

%defining variables
n=length(x);
h=x(2)-x(1);

%check if segment sizes are equal
for i=2:n-1
    if x(i+1)-x(i) ~= h
        error('entries in vector x must be equally spaced!')
    end
end

%calculating I
I=y(1)+2*sum(y(2:end-1))+y(end);