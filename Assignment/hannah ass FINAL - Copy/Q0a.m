% Q0a
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 7-May-2021

fprintf(' Q0a\n======================================================\n')

%% Import Data
D=importdata('Sluice_efficiency.csv').data; %importing data
x=D(:,1);
y=D(:,2);

%% Plot Data
figure(1)  %figure 1
plot(x,y,'ko') %plotting data (sluice recovery as a function of input speed)
xlabel('Feed Rate (Shovels/min')
ylabel('Sluice Gold Recovery Rate (%)')
title('Sluice Gold Recovery Rate against Feed Rate')
hold on

%% Fit Tanh to Data
[a0,a1]=linreg(x,log(100./y-1));
sr=@(x) 100./(1+exp(a1.*x+a0));
plot(x,sr(x),'r')
legend('Raw Data','Fitted Curve (Tanh)','Location','south outside')

%% Print Output
fprintf('Figure 1: Sluice Gold Recovery Rate against Feed Rate\n')
fprintf('Fitted Tanh Function: y = 100/(1+exp(%.2f%.2fx)).\n\n',a1,a0)