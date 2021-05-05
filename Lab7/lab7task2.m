% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 2
close all; clc; clear

% declare variables
p = 1.225;
mu = 1.789e-5;
Vi = 20;

% declare boundary profile formulas
Re = @(x) p*x*Vi/mu;
L99 = @(x) 5*x./sqrt(Re(x));
T99 = @(x) 0.37*x./(Re(x).^(1/5));

% plot
domx = 0:0.01:15;
plot(domx,L99(domx),'-k')
hold on
plot(domx,T99(domx),'-b')
title('Thickness of Boundary Layer Profiles at Standard Atmospheric Conditions')
xlabel('Distance from Start of Flat Plate (m)')
ylabel('Boundary Layer Thickness (m)')
% plot intersection
f = @(x) abs(L99(x)-T99(x));
root = secant(f,2,4,1e-10);
plot(root,L99(root),'or')
% task wanted 2dp but 2 sig used instead
legend('99% BLT for laminar profile','99% BLT for turbulent profile',sprintf('Intersection at (%g, %g)',round(root,2,'significant'),round(L99(root),2,'significant')),'Location','best')