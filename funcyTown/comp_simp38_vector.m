function I = comp_simp38_vector(x,y)
%function I = comp_simp38_vector(x,y)
%
%Written by: Hannah Tay 32521987
%Date created: 12th May 2021
%
%uses the composite Simpson's 3/8 rule to approximate the definite integral of a
%given function f between the given limits of integration
%
%inputs:
%x - x-values of data set
%y - y-values of data set

%checking for error in the number of points
if n<4 || rem(n-1,3)~=0
    error('wrong number of points for integration')
end

%defining variables
n=length(x);
h=x(2)-x(1);

%calculating I
I=3*h/8*(y(1)+3*sum(y(2:3:end-2))+3*sum(y(3:3:end-1))+2*sum(y(4:3:end-3))+y(end));