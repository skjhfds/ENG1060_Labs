function I = comp_simp13_vector(x,y)
%function I = comp_simp13_vector(x,y)
%
%Written by: Hannah Tay 32521987
%Date created: 12th May 2021
%
%uses the composite Simpson's 1/3 rule to approximate the definite integral of a
%given function f between the given limits of integration
%
%inputs:
%x - x-values of data set
%y - y-values of data set

%checking for error in the number of points
if n<3 || rem(n,2)==0
    error('wrong number of points for integration')
end

%defining variables
n=length(x);
h=x(2)-x(1);

%calculating I
I = h/3*(y(1)+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-2))+y(end));