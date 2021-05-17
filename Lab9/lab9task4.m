% Harry Choi 32464223
% 13-May-2021
% Lab 9 Task 4
clc; clear; close all;

% define function
f=@(x) (1+x.^2-sin(x))./(cos(x)+x);

% find integrals
n1=3;
n2=4;
I13=comp_simp13(f,0,10,n1);
I38=comp_simp38(f,0,10,n2);

% errors
E=abs((I13-I38)/I38)*100;

%using while loop to add more applications to each computation of integral
%until error is less than 10e-10%
i=1;
while E>10e-10
    n1=n1+2;
    n2=n2+3;
    I13=comp_simp13(f,0,10,n1);
    I38=comp_simp38(f,0,10,n2);
    E=abs((I13-I38)/I38)*100;
    i=i+1;
end

%printing
fprintf('The number of applications required to achieve the required percentage error is %.0f\n',i)
fprintf('The number of points required for comp_simp13 is %.0f\n',n1)
fprintf('The number of points required for comp_simp38 is %.0f\n',n2)