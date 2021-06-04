function I = comp_simp13 (f,a,b,n)
%function I = comp_simp13 (f,a,b,n)
%
%uses the Simpson's 1/3 rule to approximate the definite integral of a
%given function f between the given limits of integration
%
%inputs:
%f - function handle
%a - lower limit of integral
%b - upper limit of integral
%n - number of points
%
%outputs:
%I - approximation for integral

%checking for error in the number of points
if n<3 || rem(n,2)==0
    error('wrong number of points for integration')
end

%defining variables
h=(b-a)/(n-1);
x=linspace(a,b,n);

%calculating I
I = h/3*(f(a)+4*sum(f(x(2:2:end-1)))+2*sum(f(x(3:2:end-2)))+f(b));