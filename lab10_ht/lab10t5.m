%Written by: Hannah Tay 32521987
%Date created: 19th May 2021

clc; clear; close all; 

a=[0.1 0.5 1 5 10 20]; %alpha

dydt=cell(1,6);
for i=1:length(a)
    dydt{i}=@(t,y) exp(-2.*t).*cos(y)-0.1.*a(i).*y.^2; %ODE
end

y0=1; %initial condition
tspan=[0 20]; %tspan
h=0.01; %step size

%using Heun's method to solve with different a values
for i=1:length(a)
    [t,y(i,:)]=heun(dydt{i},tspan,y0,h);
end

%plotting
plot(t,y)
title('solution of an ODE with parameter a (using Heun''s method)')
xlabel('independent variable, t')
ylabel('dependent variable, y')

%legend
L=strings(1,length(a));
for i=1:length(a)
    L(i)=sprintf('a=%g',a(i));
end
legend(L,'location','best')

%exporting data to txt file
fileID=fopen('diff_eqn.txt','w');
fprintf(fileID,'alpha      y(20)\n')
fprintf(fileID,'-----------------\n')

y_new=y(:,end); %value of y at t=20

for i=1:length(a)
    if i<=4
        fprintf(fileID,'%.1f%14.4f\n',a(i),y_new(i));
    else 
        fprintf(fileID,'%.1f%13.4f\n',a(i),y_new(i));
    end
end

fclose(fileID); clc;