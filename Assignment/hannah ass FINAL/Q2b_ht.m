% Q2b

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 13th May 2021

fprintf('\n Q2b\n=====================================================\n')

%% (i) Define equations
dig_time=sum(available_shov./4); %shovels per deposit/4 shovels per minute
wade_time=sum(sluice_dist./10); %distance from sluice per deposit/10 m/s wade speed
sluice_time=@(f_rate) sum(available_shov)./f_rate; %total number of buckets/feed rate

total_time=@(f_rate) dig_time+wade_time+sluice_time(f_rate);

figure(6) %figure 6
domt=0:0.1:7; %domain for plot
plot(domt,total_time(domt))
title('site 2: total digging time vs sluice feed rate')
xlabel('sluice feed rate (shovels/min)')
ylabel('total time (min)')

fprintf('Figure 6 shows a plot of the total time as a function of feed rate.\n\n')
fprintf('The equations used are:\n')
fprintf('dig_time = sum(shovels_per_depth/4)\n')
fprintf('wade_time = sum(distance_from_sluice/10)\n')
fprintf('sluice_time = total_buckets/feed_rate\n')
fprintf('total_time = dig_time + wade_time + sluice_time\n\n')

%% (ii) Find maximum
%total time should be 240 min 
%solving equation total_time-240 = 0
%defining equation
time=@(f_rate) total_time(f_rate)-240;

%solving using modified secant method
[root2b,it]=modisecant(time,1,0.1,1e-10);

fprintf('The ideal conditions are: a feed rate of %.2f shovels/min, digging at every\nlocation.\n\n',root2b)

%% (iii) Determine final gold haul
recovered_gold2=sluice_recov(root2b)/100*sum(G2.*available_shov);
fprintf('Given that we exhaust the gold content at every location of this site, the final\ngold haul is %.2fg.\n\n',recovered_gold2)