% Harry Choi 32464223
% 1-april-2021
% Lab 4 Task 4
close all; clc; clear

%create data
m = linspace(50,100,7);
k = 0.12;
n = 0.9;
[vt,yt] = terminalDrop(m,k,n);

%plot
subplot(2,1,1)
plot(m,vt,'-k')
title('Terminal Velocity Against Mass')
xlabel('Mass of Skydiver in Kg')
ylabel('Terminal Velocity of Skydiver in ms^-1')
legend('Terminal Velocity Against Mass','Location','bestoutside')
subplot(2,1,2)
plot(m,yt,'bo')
title('Distance to 90% Terminal Velocity Against Mass')
xlabel('Mass of Skydiver in Kg')
ylabel('Distance to 90% Terminal Velocity in m')
legend('Distance to 90% Terminal Velocity Against Mass','Location','bestoutside')

%print output to .txt
f = fopen('skydivers.txt','w');
fprintf(f,'mass (kg)  vt (m/s)    yt (m)\n');
fprintf(f,'%9.2f %9.2f %9.2f\n',[m,vt,yt]);
fclose(f);