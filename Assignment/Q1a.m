% Q1a

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q1a\n===================================\n')

data1=importdata('Site1_depth_profile.csv'); %importing from csv file

x1a=data1.data(:,2); %extracting data for plotting
y1a=data1.data(:,3);

figure(2) %figure 2
plot(x1a,y1a,'ko') %plotting raw data (gold per shovel load as a function of depth)
ylabel('weight of gold (g/shovel)')
xlabel('depth from surface (cm)')
title('site 1: weight of gold per shovel as a function of depth')
hold on

%fitting linear function to data
[b0,b1]=linreg(x1a,y1a);
gold_conc=@(x) b0+b1.*x;
plot(x1a,gold_conc(x1a),'r') %plotting fitted curve
legend('raw data','fitted curve (linear)','location','south outside')

fprintf('The fitted function for gold per shovel at site 1 is ')
b1_new=round(b1,4,'significant');
fprintf('y = %.4f+%gx\n',b0,b1_new)

best_depth=x1a(y1a==max(y1a));
fprintf('The depth with the highest gold concentration at site 1 is %.0fcm.\n',best_depth)