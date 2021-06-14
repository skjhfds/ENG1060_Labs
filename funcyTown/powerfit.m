function [p,r2] = powerfit(x,y)
p = polyfit(log(x),log(y),1);
[a0,a1,r2]=linreg(log(x),log(y));