% Harry Choi 32464223
% 15-Apr-2021
% Lab 5 Task 4
close all; clc; clear

% import data
data = importdata('Velocity_Data.dat');
t = data(1,3:end); % time stamps
v1 = data(2,3:end); % time history of Velocity 1

% create 5 point and 11 point moving averages
pma5 = Velocity_Correction(v1);
pma11 = General_Velocity_Correction(v1,11);

% plot all values
subplot(2,1,1)
plot(t,v1,'-r')
hold on
plot(t,pma5,'-g')
plot(t,pma11,'-b')
xlabel('Time Stamp')
ylabel('Time History of Velocity')
title(sprintf('Time History of Velocity at (%.0f, %.0f)',data(2,1:2)))
legend('Uncorrected Velocity','5 Point Moving Average','11 Point Moving Average','Location','best outside')

% plot for 1 < time < 1.1
L = logical(1<t & t<1.1);
subplot(2,1,2)
plot(t(L),v1(L),'-r')
hold on
plot(t(L),pma5(L),'-g')
plot(t(L),pma11(L),'-b')
xlabel('Time Stamp')
ylabel('Time History of Velocity')
title(sprintf('Time History of Velocity at (%.0f, %.0f) for (1 < time < 1.1)',data(2,1:2)))
legend('Uncorrected Velocity','5 Point Moving Average','11 Point Moving Average','Location','best outside')


