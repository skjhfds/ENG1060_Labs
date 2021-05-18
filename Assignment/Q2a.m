% Q2a
% Name :Harry Choi
% ID   :32464223
% Date Modified : 12 May 2021

fprintf('\n  Q2a\n===================================\n')
%% Import data
D  =importdata('Site2_position_profile.csv').data;
dfs=D(:,1); % distance from sluice
gw =D(:,2); % gold weight (per deposit)
spd=D(:,3); % shovels per deposit
spb=6;      % shovels per bucket

%% Plot weight of gold per bucket against position
figure(5)
subplot(2,1,1)

x = dfs;
y = gw./spd*spb;

plot(x,y)
% assume that task asked for mass in (g), not weight
 title('Mass of Gold per Bucket Load against Position (Deposit 2)')
xlabel('Distance from Sluice (m)')
ylabel('Mass of Gold per Bucket Load (g)')

% fit exponential to graph, print and plot
[c0,c1] = linreg(x,log(y));
c0 = exp(c0);
fprintf('Subplot 1 Line of best fit:\n  f(x) = (%g)e^{%g*x}\n',c0,c1)
f = @(t) c0*exp(c1*t);
domt = min(x):0.1:max(x);
hold on
plot(domt,f(domt))

% legend
legend('Mass of Gold per Bucket Load','Exponential Line of Best Fit','Location','best')
%% Plot number of bucket loads per deposit against position
subplot(2,1,2)

y = spd/spb;

plot(x,y)
 title('Bucket Loads per Deposit against Position (Deposit 2)')
xlabel('Distance from Sluice (m)')
ylabel('Number of Gold-bearing Bucket Loads')

% fit quadratic to graph, print and plot
p = polyfit(x,y,2);
hold on
plot(domt, polyval(p, domt))
fprintf('\nSubplot 2 Line of best fit:\n  f(x) = %s\n\n',sprintf('(%g)x^2 + (%g)x + (%g)',p))

% legend
legend('Bucket Loads per Deposit','Polynomial of Best Fit','Location','best')