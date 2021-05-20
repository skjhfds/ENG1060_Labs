% Q1a

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q1a\n======================================================\n')

data1=importdata('Site1_depth_profile.csv'); %importing from csv file

D1=data1.data(:,2); %depth
G1=data1.data(:,3); %gold at each depth

figure(2) %figure 2
plot(D1,G1,'ko') %plotting raw data (gold per shovel load as a function of depth)
ylabel('weight of gold (g/shovel)')
xlabel('depth from surface (cm)')
title('site 1: weight of gold per shovel as a function of depth')
hold on

%fitting linear function to data
[b0,b1]=linreg(D1,G1);
f1a=@(x) b0+b1.*x;
x1a_new=0:0.1:max(D1);
plot(x1a_new,f1a(x1a_new),'r') %plotting fitted curve
legend('raw data','fitted curve (linear)','location','south outside')

fprintf('The fitted function for gold per shovel at site 1 is ')
b1_new=round(b1,4,'significant');
fprintf('y = %.4f+%gx.\n',b0,b1_new)

best_depth=D1(G1==max(G1));
fprintf('The depth with the highest gold concentration at site 1 is %.0fcm.\n',best_depth)
fprintf('Figure 2 shows the gold per shovel load as a function of depth at site 1.\n')