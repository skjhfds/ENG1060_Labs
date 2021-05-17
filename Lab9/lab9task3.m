% Harry Choi 32464223
% 13-May-2021
% Lab 9 Task 3
close all; clc; clear

% define variables and functions
H = 0.7;
Vinf = 11;
p = 1.15;
V = @(x) 10*p.*(1./(1-x.^2))-10*p;
domh = 0:0.05:0.7;

% plotting
plot(domh,V(domh))
title('Boundary Layer Velocity against Height')
xlabel('Height (m)')
ylabel('Velocity (m/s)')
legend('Boundary Layer Velocity','Location','southoutside')

%calculating displacement and momentum thickness
dt=@(x) 1-V(x)/Vinf;
mt=@(x) (V(x)/Vinf).*(1-V(x)/Vinf);
% trapezoidal
dt_trap=comp_trap(dt,domh(1),domh(end),99);
mt_trap=comp_trap(mt,domh(1),domh(end),99);
% simpson's 1/3
dt_simp=comp_simp13(dt,domh(1),domh(end),99);
mt_simp=comp_simp13(mt,domh(1),domh(end),99);
% integral()
dt_int=integral(dt,domh(1),domh(end));
mt_int=integral(mt,domh(1),domh(end));

%printing 
d=round([dt_trap,dt_simp,dt_int],5,'significant');
m=round([mt_trap,mt_simp,mt_int],5,'significant');
fprintf('The displacement thickness (m)\n')
fprintf('   Trapezoidal: %f\n Simpson''s 1/3: %f\n    Integral(): %f\n',d)
fprintf('\nThe momentum thickness (m)\n')
fprintf('   Trapezoidal: %f\n Simpson''s 1/3: %f\n    Integral(): %f\n',m)