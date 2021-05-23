% Q2a
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 13-May-2021

fprintf('\n Q2a\n=====================================================\n')

%% Import Data
D=importdata('Site2_position_profile.csv').data;
sluice_dist=D(:,1); %distance from sluice
G2=D(:,2); %gold weight (per deposit)
available_shov=D(:,3); %shovels per deposit
num_shovels=6; %shovels per bucket

%% Plot 1: weight of gold per bucket vs position
figure(5)
subplot(2,1,1)

x=sluice_dist; 
y=G2./available_shov*num_shovels;

plot(x,y)
title('(Site 2) Mass of Gold per Bucket Load against Position')
xlabel('Distance from Sluice (m)')
ylabel('Mass of Gold per Bucket Load (g)')

% Fit Exponential to Data
[c0,c1]=linreg(x,log(y));
fprintf('(Figure 5) Gold vs position Fitted Exponential Function : y=(%g)exp(%g*x)\n',c0,c1)
f2a=@(x) exp(c0)*exp(c1*x);
hold on
plot(x,f2a(x))
legend('Mass of Gold per Bucket Load','Fitted Curve (Exponential)','Location','best')

%% Plot 2: number of bucket loads per deposit vs position
subplot(2,1,2)
y=available_shov/num_shovels;

plot(x,y)
title('(Site 2) Bucket Loads per Deposit against Position')
xlabel('Distance from Sluice (m)')
ylabel('Number of Gold-bearing Bucket Loads')

% Fit Polynomial to Graph
p2=polyfit(x,y,2);
hold on
plot(x,polyval(p2,x))
fprintf('(Figure 5) Bucket Loads against Position Fitted Polynomial Function: y=%s\n\n',sprintf('(%g)x^2+(%g)x+(%g)',p2))
legend('Bucket Loads per Deposit','Fitted Curve (Quadratic)','Location','best')