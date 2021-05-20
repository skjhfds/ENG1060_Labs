% Q2a

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 13th May 2021

fprintf('\n Q2a\n=====================================================\n')

%% importing data
data2=importdata('Site2_position_profile.csv').data;
sluice_dist=data2(:,1); %distance from sluice
G2=data2(:,2); %gold weight (per deposit)
available_shov=data2(:,3); %shovels per deposit
num_shovels=6; %shovels per bucket

%% plot 1: weight of gold per bucket vs position
figure(5) %figure 5
subplot(2,1,1)

x2a=sluice_dist; 
y2a=G2./available_shov*num_shovels;

plot(x2a,y2a)
title('site 2: mass of gold per bucket load vs position')
xlabel('distance from sluice (m)')
ylabel('mass of gold per bucket load (g)')

%fitting exponential curve to data
[c0,c1]=linreg(x2a,log(y2a));
fprintf('Gold vs position fitted function (figure 5): y=(%g)exp(%g*x)\n',c0,c1)
f2a=@(x) exp(c0)*exp(c1*x);
hold on
plot(x2a,f2a(x2a))
legend('mass of gold per bucket load','fitted curve (exponential)','location','best')

%% plot 2: number of bucket loads per deposit vs position
subplot(2,1,2)
y2a=available_shov/num_shovels;

plot(x2a,y2a)
title('site 2: bucket loads per deposit vs position')
xlabel('distance from sluice (m)')
ylabel('number of gold-bearing bucket loads')

%fitting polynomial (i'm sorry) to graph
p2=polyfit(x2a,y2a,2);
hold on
plot(x2a,polyval(p2,x2a))
fprintf('Bucket loads vs position fitted function (figure 5): y=%s\n\n',sprintf('(%g)x^2+(%g)x+(%g)',p2))
legend('bucket loads per deposit','fitted curve (quadratic)','location','best')