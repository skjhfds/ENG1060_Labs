function y = expval(p,x)
A = exp(p(2));
B = p(1);
y = A*exp(B*x);