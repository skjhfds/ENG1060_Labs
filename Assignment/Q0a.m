% Q0a

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q0a\n===================================\n')

data0=importdata('Sluice_efficiency.csv').data; %importing data
x0=data0(:,1);
y0=data0(:,2);

figure(1)  %figure 1
plot(x0,y0,'ko') %plotting data (sluice recovery as a function of input speed)
xlabel('standard shovel loads (3L) per minute')
ylabel('gold recovery of the sluice (%)')
title('sluice gold recovery rates vs feed rate')
hold on

%fitting tanh function to data
y0_new=log(100./y0-1);
[a0,a1]=linreg(x0,y0_new); %using linreg function
sluice_recov=@(x) 100./(1+exp(a1.*x+a0));

plot(x0,sluice_recov(x0),'r') %plotting fitted curve
legend('raw data','fitted curve (using tanh)','location','south outside')

fprintf('Figure 1 shows a plot of the raw data and the fitted tanh curve\n')
fprintf('for the sluice recovery rate as a function of feed rate\n')
fprintf('The fitted function for sluive recovery is y = 100/(1+exp(%.2f%.2fx))\n\n',a1,a0)