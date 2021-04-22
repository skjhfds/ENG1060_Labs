clear; clc; close all

% Step A
T = 1;
% domT = -T:0.0001:T;
% 
% f = @(t) 1.*(0<=t & t<=T) + -1.*(-T<=t & t<0);
% 
% plot(domT,f(domT),'-r')

% Step B
%kMax = input('Maximum k value:');
kMax = 5;
domT = -1:0.0001:1;

%*sum( 1./(2*k+1)sin((2*k+1)*pi/T) )
k = 0:kMax;

t = domT;
p1 = (2*k+1).^-1;
p2 = sin( (2*k+1)'*pi*t/T );
F = p1 * p2;

F = @(t) 4/pi * (2*k+1).^-1 * sin( (2*k+1)'*pi*t/T );
test = F(domT);

%hold on
plot(domT,test,'-b')
%title('Fourier plot with %.0f terms',kMax+1)
xlabel('t')
ylabel('F(t)')
%legend('f(t) square wave','F(t) Fourier plot','Location','north west')