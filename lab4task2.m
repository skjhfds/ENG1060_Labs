% Harry Choi 32464223
% 31-Mar-2021
% Lab 4 Task 2
close all; clc; clear

%import data
A = importdata("lab4_plot_data2.txt");

%assume lab questions incorrect, columns are x & y, not rows
%define x & y
x = A(:,1);
y = A(:,2);

%plot y against x and sin(x)
subplot(2,1,1)
plot(x,y,'ro')
hold on
plot(x,sin(x),'-k')
title('y against x')
xlabel('x')
ylabel('y')
legend('y(x)','sin(x)','Location','bestoutside')

%filter x and y
filteredIndex = abs(y-sin(x))<1;

%plot filtered y against x and sin(x)
subplot(2,1,2)
plot(x(filteredIndex),y(filteredIndex),'bd')
hold on
plot(x,sin(x),'-k')
title('y against x')
xlabel('x')
ylabel('y')
legend('filtered y(x)','sin(x)','Location','bestoutside')
fprintf('%.0f data points contained noisy data.',sum(~filteredIndex))