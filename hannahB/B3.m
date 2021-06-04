clc; clear; close all;

f=@(x) x.*sin(x)-5./x;

%approximating the integral by alternating trapezoidal rule and simpson's
%1/3
%e.g. points 1,2: trapezoidal
%     points 2,3,4: simpson's 1/3 

a=1:4; %step through
I=0;
for i=1:1999 %idk, trial and error for the desired 6001 points
    %summing the I values as we go
    I=I+trap(f,a(1),a(2));
    I=I+comp_simp13(f,a(2),a(4),3);
    a=a+3;
end

req=round(I); %required value