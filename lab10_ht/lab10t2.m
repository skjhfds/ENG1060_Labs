%Written by: Hannah Tay 32521987
%Date created: 19th May 2021

clc; clear; close all; 

dydt=@(t,y) 3.*exp(t)-8.*y./3; %ODE
h=[1 0.75 0.5 0.001]; %step sizes
y0=3; %initial condition

%finding and plotting results of ODE for each step size
for i=1:4
    [t,y]=euler(dydt,[0 3],y0,h(i));
    plot(t,y)
    hold on
end

%plotting analytical solution
t1=0:0.1:3;
y1=@(t) (9/11).*exp(t)+(24/11).*exp((-8/3).*t);
plot(t1,y1(t1),'k-','linewidth',3)
title('solutions of an ODE with different step sizes')
xlabel('independent variable, t')
ylabel('dependent variable, y')

%legend
L=strings(1,5);
for i=1:4
    L(i)=sprintf('Euler''s method (step size %g)',h(i));
end
L(5)='analytical method';
legend(L,'location','best')

%calculating and printing the error 
for i=1:4
    [t2,y2]=euler(dydt,[0 3],3,h(i));
    E(i)=abs((y2(end)-y1(3))/y1(3))*100;
end

fprintf('Percentage error between Euler''s method and analytical result:\n')
fprintf('h          %%error\n')
fprintf('=====================\n')
fprintf('%g%15.2f\n',h(1),E(1))
fprintf('%g%12.3f\n',h(2),E(2))
fprintf('%g%13.3f\n',h(3),E(3))
fprintf('%g%11.3f\n',h(4),E(4))