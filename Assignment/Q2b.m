% Q2b
% Name :Harry Choi
% ID   :32464223
% Date Modified : 12 May 2021

fprintf('\n  Q2b\n===================================\n')

%% (i) Define equations
dig_time=sum(spd./4); %shovels per deposit/4 shovels per minute
wade_time=sum(dfs./10); %distance from sluice per deposit/10 m/s wade speed
sluice_time=@(f_rate) sum(spd)./f_rate; %total number of buckets/feed rate
total_time=@(f_rate) dig_time+wade_time+sluice_time(f_rate);

figure(6) %figure 6
domt=0:0.1:7;
plot(domt,total_time(domt))
title('site 2: total digging time vs sluice feed rate')
xlabel('sluice feed rate (shovels/min)')
ylabel('total time (min)')

fprintf('The equations used are:\n');
fprintf('dig_time = sum(shovels_per_depth/4)\n');
fprintf('wade_time = sum(distance_from_sluice/10)\n');
fprintf('sluice_time = total_buckets/feed_rate\n');
fprintf('total_time = dig_time + wade_time + sluice_time\n\n');

%% (ii) Find maximum
%total time should be 240 min 
%solving equation total_time-240 = 0
%defining equation
time=@(f_rate) total_time(f_rate)-240;

%solving using modified secant method
[root2b,it]=modisecant(time,1,0.1,1e-10);

fprintf('The ideal conditions are: a feed rate of %.2f shovels/min, digging at every location.\n\n',root2b);

%% (iii) Determine final gold haul
fprintf('Given that we exhaust the gold content at every location of this site, the final gold haul is %.2fg.\n\n',sum(gw.*spd));
