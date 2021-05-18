% Q0a

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q0a \n\n')

data0=importdata('Sluice_efficiency.csv'); %importing data from csv file
num_data0=data0.data; %extracting numerical data from file
x0=num_data0(:,1);
y0=num_data0(:,2);

figure(1)  %figure 1
plot(x0,y0,'ko') %plotting data (sluice recovery as a function of input speed)
xlabel('standard shovel loads (3L) per minute')
ylabel('gold recovery of the sluice (%)')
title('Sluice gold recovery rates as a function of feed speed')
hold on

%fitting appropriate function to data
y0_new=log(100./y0-1);
[a0,a1,r2]=linreg(x0,y0_new);
sluice_recov=@(x) 100./(1+exp(a1.*x+a0));
plot(x0,sluice_recov(x0),'r')
legend('raw data','fitted curve (using tanh)','location','south outside')
