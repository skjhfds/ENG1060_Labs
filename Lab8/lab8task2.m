% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 2
close all; clc; clear

% data
anim = ["Cow","Human","Sheep","Hen","Rat","Dove"];
mass = [400,70,45,2,0.3,0.16];
meta = [270,82,50,4.8,1.45,0.97];
% find equation
p = polyfit(log10(mass),log10(meta),1);
p(1) = 10^p(1);
eq = "metabolism = (" + num2str(p(1)) + ")mass^(" + num2str(p(2)) + ")";
% find r^2
st = sum((meta-mean(meta)).^2);
r2 = (st-sum((meta-(p(1)*mass.^p(2))).^2))/st;
% plot data
plot(meta, mass, 'bx')
hold on
domM = 0:0.1:max(meta);
plot(domM, p(1)*domM.^p(2), '-r')

% print output
fprintf('Non-linear equation: %s\n          r^2 value: %4f\n',eq,r2)
