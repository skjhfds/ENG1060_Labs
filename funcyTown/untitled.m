clear; close all; clc
%% Question 1
% f = @(x) x*sin(x)-4*x^2+30;
% falseposition(f,-10,1,1e-8)
%% Question 2
% D = importdata('curvefit.txt');
% x = D(1,:);
% y = D(2,:);
% 
% x95 = [];
% for i = 5:45
%     p = polyfit(x,y,i);
%     x95 = [x95 , polyval(p,9.5)];
% end
% 
% p = powerfit(x,y);
% x95 = [x95 , powerval(p,9.5)];
% 
% p = saturationfit(x,y);
% x95 = [x95 , saturationval(p,9.5)];
% 
% round(sum(x95))
%% Question 3
% f = @(x) x.*sin(x)-5./x;
% x = linspace(5,3000,6002);
% I = 0;
% i=1;
% while i+1 <= length(x)
%     I = I + comp_trap(f,x(i),x(i+1),2);
%     if i+3 > length(x)
%         break
%     end
%     I = I + comp_simp13(f,x(i+1),x(i+3),3);
%     i = i+3;
% end
% round(I)
%% Question 4
D = importdata('linsys.txt');
liquad(D(:,1:300),D(:,301))
























