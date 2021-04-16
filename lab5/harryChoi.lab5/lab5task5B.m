% Harry Choi 32464223
% 15-Apr-2021
% Lab 5 Task 5 Part B
close all; clc; clear

gR = (1+sqrt(5))/2;
a=5;
b=8;

% initialise array with first two numbers
fSeq(1:2) = [a,b];

% number of items in list
i=2;
% calculate Fibonacci until adjacent value ratio is within 1e-5 of golden ratio
while abs(fSeq(end)/fSeq(end-1)-gR)>=1e-5
    i=i+1;
    fSeq(i) = sum(fSeq(i-2:i-1));
end

% plot ratios
plot(1:i-1,fSeq(2:i)./fSeq(1:i-1),'-x')
hold on
% plot golden ratio
yline(gR,'--r')
title(sprintf('Fibonacci Ratios Starting with [%.0f, %.0f]',a,b))
xlabel('Ratio Pair Number')
ylabel('Adjacent Fibonacci Value Ratio')
legend('Adjacent Fibonacci Value Ratio','Golden Ratio','Location','best outside')

% print number of Fibonacci terms required
fprintf('%.0f Fibonacci numbers needed to achieve absolute error less than 1.000000e-05',i)
