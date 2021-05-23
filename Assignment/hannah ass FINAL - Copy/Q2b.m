% Q2b
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 13-May-2021

fprintf('\n Q2b\n=====================================================\n')

%% (i) Define equations
dig_time=sum(available_shov./4);                   %shovels per deposit/4 shovels per minute
wade_time=sum(sluice_dist./10);                    %distance from sluice per deposit/10 m/s wade speed
sluice_time=@(f_rate) sum(available_shov)./f_rate; %total number of buckets/feed rate

total_time=@(f_rate) dig_time+wade_time+sluice_time(f_rate);

figure(6)
domt=0:0.1:7;
plot(domt,total_time(domt))
title('(Site 2) Total Digging Time against Sluice Feed Rate')
xlabel('Sluice Feed Rate (Shovels/min)')
ylabel('Total Digging Time (min)')

fprintf('Figure 6: (Site 2) Total Digging Time against Sluice Feed Rate\n\n')
fprintf('The equations used are:\n')
fprintf('dig_time = sum(shovels_per_depth/4)\n')
fprintf('wade_time = sum(distance_from_sluice/10)\n')
fprintf('sluice_time = total_buckets/feed_rate\n')
fprintf('total_time = dig_time + wade_time + sluice_time\n\n')

%% (ii) Find maximum
time=@(f_rate) total_time(f_rate)-240; % Total Time is 240 min
% Solving using Modified Secant Method
[root2b,it]=modisecant(time,1,0.1,1e-10);
fprintf('The ideal conditions are: a feed rate of %.2f shovels/min, digging at every\nlocation.\n\n',root2b)

%% (iii) Determine Final Gold Haul
recovered_gold2=sr(root2b)/100*sum(G2.*available_shov);
fprintf('Given Gold Content is Exhausted at every Location,/n Final Gold Haul: %.2fg.\n\n',recovered_gold2)