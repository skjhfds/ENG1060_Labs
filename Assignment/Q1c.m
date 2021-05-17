% Q1c

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 13th May 2021

fprintf('\n Q1c \n\n')

clc; clear; %DELETE BEFORE SUBMITTING

%% (i) Define equations
%using a pick
%equation 1: number of buckets collected
time_sluice_p=@(frate) 6./frate;
time_1bucket_p=@(time_sluice) 30*6+40+time_sluice;
num_buckets_p=@(frate) (4*60*60-40*60)./time_1bucket_p;

%equation 2: amount of gold collected
collected_gold_p=@(frate) avg_gold(2)*num_buckets_p(frate);

%equation 3: amount of gold recovered
recovered_gold_p=@(frate) f0(frate)/100.*collected_gold_p(frate);

fprintf('The equations used are:\n');

%% (ii) Find maximum
dGp_df=@(frate) 

%fprintf('The ideal conditions are:\n');
%% (iii) Determine final gold haul

%fprintf('The final weight of gold is:\n');