clc; clear; close all;

%checking if functions work :')

%gauss partial pivot counter (i1)
A=[1 0 0; 0 0 1; 0 1 0];
b=[1 1 1]';
[x1,i1]=gauss(A,b);

%false position xu_change counter (xu_change)
VO2max=@(x)(0.1.*sin(0.07.*x).*x.^1.8)+35;
A=@(x)VO2max(x)-54.5;
[x2,i2,xu_change,xl_change]=falseposition(A,15,25,1e-04);
