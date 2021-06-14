function [p,r2] = saturationfit(x,y)
p = polyfit(1./x,1./y,1);
[a0,a1,r2]=linreg(1./x,1./y);