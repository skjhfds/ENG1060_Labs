function I = trap(f,a,b)
%function I = trap(f,a,b)

%
%Written by: Hannah Tay 32521987 
%Date created: 26th May 2021
%
%WRITTEN FOR CONSOLIDATION QUIZ
%
%approximates the integral of f from a to b as the area of the trapezoid
%between these points and f(a), f(b)
%
%inputs:
%f - function handle
%a - lower limit of integration
%b - upper limit of integration
%
%outputs:
%I - integral

I=(b-a)*0.5*(f(a)+f(b));