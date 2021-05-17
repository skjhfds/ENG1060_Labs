% Harry Choi 32464223
% 13-May-2021
% Lab 9 Task 5
clc; clear; close all;

%defining variables
g=9.81;
p=1000;
ht=12;
rt=2;
domh=0:0.1:ht;

%this was a divide for some reason
r = @(h) (rt/ht)*(ht-h);
F = @(h) g*p*pi*r(h).^2;
hF = @(h) h.*F(h);

% plot
plot(domh,hF(domh))
title('Force Exerted against Height of the Water')
xlabel('Height of the Water (m)')
ylabel('Force Exerted (N)')
legend('Force Exerted','Location','best')

% total work required to pump the water
Wint = integral(hF,0,ht);
fprintf('Total work required to pump the water\n           W_int: %.0fkJ\n',Wint/10^3)

% find min number of points of Simp13 accurate to 0.01%
n=3;
while true
    Wsim = comp_simp13(hF,0,ht,n);
    e = abs((Wint-Wsim)/Wint)*100;
    if e <= 0.01
        break
    end
    n = n+2;
end

% comment on error
fprintf('\nFinding total work required to pump the water\n    using composite Simpson''s 1/3 rule to error <= 0.01%%\n')
fprintf('           W_sim: %.0f\nNumber of points: %g\n           Error: %f\n',Wsim/10^3,n,e)
fprintf('\nThe error achieved was impercievable within MATLAB.\nThis was not expected as the composite Simpson''s Rule\n is meant to be just an estimate of the integral,\n especially using only 3 points.')