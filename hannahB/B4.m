clc; clear; close all;

dydx=@(x) x./2-5;

%using heun's method
%after the values of the predictor derivative (y2)
[x,y,y1,y2]=heun(dydx,[0 99],28,1/2);

req=round(sum(y2)); %required value