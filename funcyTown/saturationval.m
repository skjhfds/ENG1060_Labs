function y = saturationval(p,x)
a = 1/p(2);
b = a*p(1);
y = a*x/(b+x);