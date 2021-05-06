% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 2
close all; clc; clear

% data
anim = ["Cow","Human","Sheep","Hen","Rat","Dove"];
mass = [400, 70, 45, 2, 0.3, 0.16];
meta = [270, 82, 50, 4.8, 1.45, 0.97];
% find equation
p = polyfit(log(mass),log(meta),1);
p(2) = exp(p(2));
eq = "metabolism = (" + num2str(p(2)) + ")mass^(" + num2str(p(1)) + ")";
% find r^2 change to linear one 0.9982
st = sum((meta-mean(meta)).^2);
r2 = (st-sum((meta-(p(2)*mass.^p(1))).^2))/st;
% plot data
plot(mass, meta, 'bx')
hold on
domM = 0:0.1:max(mass);
plot(domM, p(2)*domM.^p(1), '-r')

% print output
fprintf('Non-linear equation: %s\n          r^2 value: %4f\n',eq,r2)

% tiger 159
