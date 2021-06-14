function [p,r2] = expfit(x,y)
p = polyfit(x,log(y),1);
[a0,a1,r2]=linreg(x,log(y));
