% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 5
% This one uses the linreg function from the preliminary
close all; clc; clear

% import data
data = importdata('covid19_aus_20200825.dat').data;
t = data(1:end, 1);
N = data(1:end, 3);

% plot
plot(t, N,'.k')
title('Victoria COVID-19 Case Numbers')
xlabel('Day Number')
ylabel('Case Numbers')

% 7 day averages
L = length(N);
day7ave=zeros(1,L); % initialise array
% set values for which 7 day averages cannot be found
day7ave(L-6:L) = mean(N(L-6:L));
for i = 1:L-7 % find 7 day averages
    day7ave(i)=mean(N(i:i+6));
end
hold on
plot(t, day7ave, 'ro')

% arrays and cells for fits
fstr = ["","",""]; % functions as strings
f = {}; r2s = []; a0 = []; a1 = [];
% period 1: exponential fit
p = 1:37;
domx = t(p);
[a0(1),a1(1),r2s(1)] = linreg(domx,log(day7ave(p))');
a0(1) = exp(a0(1));
f{1} = @(x) a0(1)*exp(a1(1)*x);
plot(domx,f{1}(domx))
fstr(1) = sprintf("%.4f*e^{%.4f*t}",a0(1),a1(1));
% period 2: linear fit
p = 38:63;
domx = t(p);
[a0(2),a1(2),r2s(2)] = linreg(domx,day7ave(p)');
f{2} = @(x) a0(2)+a1(2)*x;
plot(domx,f{2}(domx))
fstr(2) = sprintf("%.4f+%.4f*t",a0(2),a1(2));
% period 3: exponential fit, the sequel
p = 64:length(t);
domx = t(p);
[a0(3),a1(3),r2s(3)] = linreg(domx,log(day7ave(p))');
a0(3) = exp(a0(3));
f{3} = @(x) a0(3)*exp(a1(3)*x);
plot(domx,f{3}(domx))
fstr(3) = sprintf("%.4f*e^{%.4f*t}",a0(3),a1(3));


% print output
fprintf('Period  Fitted Equation               R^2\n')
fprintf('%6g  N = %24s  %.4f\n',[1:3;fstr;r2s])

% legend
legend('Victoria Case Numbers','7 Day Average','Period 1','Period 2','Period 3','Location', 'best')

% calculate day 86 if no action was taken from period 1
fprintf('\nExpected average daily case numbers at day 86 (25th Aug)\nif no action was taken from period 1: %.0f',f{1}(86))