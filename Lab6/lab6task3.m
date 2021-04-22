% Harry Choi 32464223
% 23-Apr-2021
% Lab 6 Task 3
close all; clc; clear

% define functions
f1 = @(t) exp(0.01*t).*sin(5*t);
f2 = @(t) sin(10*t) + 0.15;
f3 = @(t) sin(0.5*t).*(0.85 + sin(t));
f4 = @(t) 10 + sin(2*pi*t);
fset = {f1;f2;f3;f4};

% plot each
for i=1:4
    subplot(2,2,i)
    [x,y] = fun_polar(fset{i},10);
    plot(x,y)
    axis equal
    F=char(fset{i});
    F = ['f' num2str(i) '(t)=' F(5:end)];
    title(F)
    xlabel('x')
    ylabel('y')
    legend(F,'Location','south outside')
end