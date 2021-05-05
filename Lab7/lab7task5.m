% Harry Choi 32464223
% 30-Apr-2021
% Lab 7 Task 5
close all; clc; clear

% declare variables
L = 600;
E = 5e4;
I = 3e4;
w0 = 2.5;
% beam deflection formula
y = @(x) w0/(120*E*I*L)*(-x.^5+2*L^2*x.^3-L^4*x);
% derivative of y found using WolframAlpha
dy = @(x) w0/(120*E*I*L)*(-L^4+6*L^2*x.^2-5*x.^4);
% second derivative of y found using WolframAlpha
ddy = @(x) w0/(120*E*I*L)*4*x.*(3*L^2-5*x.^2);

% find max deflection using Newton Raphson Method
maxX = newraph(dy,ddy,260,1e-4);

% plot data
domx = 0:0.1:600;
plot(domx,y(domx))
hold on
plot(domx, dy(domx))
plot(maxX, y(maxX),'d')
title('Beam Deflection and its Derivative')
ylabel('f(x)')
xlabel('x')
legend('Beam Deflection y(x)','dy/dx(x)',sprintf('Maximum Deflection (%.2f, %.2f)',y(maxX),maxX),'Location','southoutside')

% print output
fprintf('The maximum deflection of %.2fcm occurs at %.2fcm',y(maxX),maxX)
