function I = comp_trap(f,a,b,n)
%function I = comp_trap(f,a,b,n)
%
%Written by: Hannah Tay 32521987
%Date created: 12th May 2021
%
%uses the composite trapezoidal rule to approximate the definite integral of a
%given function f between the given limits of integration
%
%inputs: 
%f - function handle
%a - lower limit of integral
%b - upper limit of integral
%n - number of segments (trapeziums)
%
%outputs:
%I - approximation for integral

%defining variables
h=(b-a)/(n-1);
x=linspace(a,b,n);

%calculating I
I=(h/2)*(f(a)+2*sum(f(x(2:end-1)))+f(b));
