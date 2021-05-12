% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 2
close all; clc; clear

% data
mass = [400, 70, 45, 2, 0.3, 0.16];
meta = [270, 82, 50, 4.8, 1.45, 0.97];

% find equation
x = log(mass);
y = log(meta);
p = polyfit(x,y,1);
eq = "metabolism = " + num2str(exp(p(2))) + "*mass^{" + num2str(p(1)) + "}";
% find r^2
st = sum((y-mean(y)).^2);
r2 = (st-sum((y-(p(2)+p(1)*x)).^2))/st;

% plot data
plot(mass, meta, 'rd')
title(sprintf('%s',eq))
xlabel('Mass (kg)')
ylabel('Metabolism (Watts)')
hold on
domM = 0:1:500;
ieData = exp(p(2))*domM.^p(1);
plot(domM, ieData, '-b')
plot(200, ieData(200), 'kd')
% print output
fprintf('Non-linear equation: %s\n          r^2 value: %4f\n\n',eq,r2)
fprintf('Metabolic Rate of Tiger (200kg): %g Watts\n',ieData(200))
