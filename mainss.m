clear;clc;close all
aStr = [];
for v = [5,20,100]
    grapherman(v);
    aStr = [aStr,"a="+num2str(v)];
end
title('Particular Solutions of this ODE')
xlabel('Time Since Entering Corrugation (s)')
ylabel('Vertical Displacement of Car Body (m)')
legend(aStr,'Location','south outside')
%% acceleration
figure(2)
aStr = [];
for v = [5,20,100]
    grapherman2(v);
    aStr = [aStr,"a="+num2str(v)];
end
title('Vertical Acceleration z''''(t) of the Vehicle')
xlabel('Time Since Entering Corrugation (s)')
ylabel('Vertical Acceleration of Car Body (ms^{-2})')
legend(aStr,'Location','south outside')

figure(3)
aStr = [];
t = 5:0.01:20;
for v = t
    aStr = [aStr,grapherman2max(v)];
end
plot(t,aStr); hold on
[m,i]=max(aStr);
plot(t(i),m,'ro')
text(t(i),m,sprintf('\n(%.2f, %.2f)',t(i),m))
title('Max z''''(t) against a')
xlabel('a (ms^{-1})')
ylabel('Maximum Vertical Acceleration of Car Body (ms^{-2})')
legend('Amplitude of Vertical Acceleration',sprintf('Maximum at (%.2f, %.2f)',t(i),m),'Location','south outside')