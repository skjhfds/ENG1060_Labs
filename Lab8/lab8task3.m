% Harry Choi 32464223
% 06-May-2021
% Lab 8 Task 3
close all; clc; clear

% import data
d = importdata('xy_data.txt');
x = d(1,1:end);
y = d(2,1:end);
% plot data
plot(x,y,'ko')
title('y against x')
xlabel('x')
ylabel('y')

% fit 7th deg polynomial
p = polyfit(x,y,7);
domx = min(x):0.1:max(x);
hold on
plot(domx, polyval(p,domx),'-r')

% separate into 2 sets
xs = logical(x<0);
xl = logical(x>0);
% fit xs to 3rd order
pxs = polyfit(x(xs),y(xs),3);
domxs = min(x):0.1:0;
plot(domxs, polyval(pxs, domxs),'-g')
% fit xl to 4th order
pxl = polyfit(x(xl),y(xl),4);
domxl = 0:0.1:max(x);
plot(domxl, polyval(pxl, domxl),'-b')

% legend
legend('y','7th order polyfit','3rd order polyfit for x<0','4th order polyfit for x>0','Location', 'best')

% print output
% the task gave a terrible sample output so I made it mroe presentable
fprintf('At x=0,\n3rd order polynomial: y = %g\n4th order polynomial: y = %g\n7th order polynomial: y = %g\n',[polyval(pxs,0), polyval(pxl,0), polyval(p,0)])