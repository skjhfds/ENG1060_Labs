% Harry Choi 32464223
% 23-Apr-2021
% Lab 6 Task 5
close all; clc; clear

nMax = 50;
alpha = 10:25;
beta = 5:30;

% matrix power matrix function
%     This function creates a [base] by [power] matrix
%     where the each element is a corresponding [base]^[power]
m = @(base,power) (base'*ones(1,length(power))).^(ones(length(base),1)*power);

% pollutant growth function
n = 1:nMax;
p = @(a,b) m(a,-n)*ones(length(n),1)*ones(1,length(b)) + (sum(n)*ones(length(a),length(b))).*m(abs(cos(b)),sin(a))';

% call function and find minimum
P = p(alpha,beta);
p_min = min(min(P));
[r,c] = find(P==p_min);

% print result
fprintf('Smallest p value is %f at a=%.0f and b=%.0f',p_min,alpha(r),beta(c))

% Unfortunately, this beautiful masterpiece took 0.106s to run which was
% slower than using for loops (0.034s) as I did in lab6task5alt.m