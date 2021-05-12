% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 4
close all; clc; clear

% data
n = 2;
m = [1.3, 1.8, 3, 4.5, 6, 8, 9];
a = [0.07, 0.13, 0.22, 0.275, 0.335, 0.35, 0.36];

% find F & V
[F, V, a0, a1, r2] = LinRegrSGR(m, a, n);

% plot data
plot(m,a,'rs')
title('acceleration against mass')
xlabel('mass (arbitrary units)')
ylabel('acceleration (arbitrary units)')
% interpolation
domM = 1:0.1:10;
hold on
f = @(x) (F*x.^n)./(V^n+x.^n);
plot(domM, f(domM), '--b')
% legend
legend('a', 'Interpolation/Extrapolation', 'Location', 'northwest')

% print output
fprintf('F  = %g\nV  = %g\na0 = %g\na1 = %g\nr2 = %g\n',[F, V, a0, a1, r2])