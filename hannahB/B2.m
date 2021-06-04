clc; clear; close all;

A=importdata('curvefit.txt');
x=A(1,:);
y=A(2,:);

%checking for the correct values of x and y
p_1=polyfit(x,y,1);
y_1=polyval(p_1,x);
y_test=polyval(p_1,9.5);

%polynomial models
for i=1:41
    p_new=polyfit(x,y,i+4);
    y_new(i)=polyval(p_new,9.5);
end

%power model
[a0,a1,r2]=linreg(log(x),log(y));
%yp=@(x) exp(a0)*x.^a1;
y_new(42)=exp(a0)*9.5^a1;

%saturation-growth model
[b0,b1,r2]=linreg(1./x,1./y);
a=1/b0; b=b1/b0;
%ys=@(x) a.*x./(x+b);
y_new(43)=a*9.5/(9.5+b);

req=floor(sum(y_new)); %required value
fprintf('%g\n',req)