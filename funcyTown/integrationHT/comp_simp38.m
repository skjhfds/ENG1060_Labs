function I = comp_simp38 (f,a,b,n)
%function I = comp_simp38 (f,a,b,n)
%
%uses the Simpson's 3/8 rule to approximate the definite integral of a
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
if n<4 || rem(n-1,3)~=0
    error('wrong number of points for integration')
end

%defining variables
h=(b-a)/(n-1);
x=linspace(a,b,n);

%calculating I
I=3*h/8*(f(a)+3*sum(f(x(2:3:end-2)))+3*sum(f(x(3:3:end-1)))+2*sum(f(x(4:3:end-3)))+f(b));