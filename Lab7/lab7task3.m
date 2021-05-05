% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 3
close all; clc; clear
R = 3;
V = @(h) pi*h.^2.*(3*R-h)/3;

% plot V-30 to find V = 30
domf = 0:0.1:2*R;
f = @(h) V(h)-30;
plot(domf,f(domf),'-k')
title('V-30')
xlabel('Height of Water in Tank (m)')
ylabel('Volume of Water in Tank - 30m^3 (m^3)')
% use Newton-Raphson Method to find root
df = @(h) pi*h.*(2*R-h); % found using WolframAlpha
xi = input('First guess:');
[root,i] = newraph(f,df,xi,1e-10);
hold on
plot(root,f(root),'^')
legend('V-30',sprintf('(%.2f, 0)',root),'Location','best')

% print output
fprintf('The depth of water required to fill the tank with 30m^3 of water is %.4fm,\n and it took %.0f iterations to solve using the Newton-Raphson method.',root,i)