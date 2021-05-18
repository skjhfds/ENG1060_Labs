% Q1c

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 13th May 2021

fprintf('\n Q1c \n\n')

clc; %DELETE BEFORE SUBMITTING

%% (i) Define equations
%equation 1: number of buckets collected
num_buckets_p=@(f_rate) (4*60*60-40*60)./(30*6+40+(6./f_rate)); %with pick
num_buckets_np=@(f_rate) 4*60*60./(60*6+40+(6./f_rate)); %without pick

%equation 2: amount of gold collected
collected_gold_p=@(f_rate) avg_gold(2)*num_buckets_p(f_rate); 
collected_gold_np=@(f_rate) avg_gold(2)*num_buckets_np(f_rate); 

%equation 3: amount of gold recovered
recovered_gold_p=@(f_rate) f0(f_rate)*60/100.*collected_gold_p(f_rate); 
recovered_gold_np=@(f_rate) f0(f_rate)*60/100.*collected_gold_np(f_rate);

fprintf('The equations used are:\n');
fprintf('number of buckets (with pick) = @(f_rate) 12000/(220+(6/f_rate))\n');
fprintf('number of buckets (without pick) = @(f_rate) 14400/(400+(6/f_rate))\n');
fprintf('collected gold = @(f_rate) avg_gold(2)*number_of_buckets(f_rate)\n');
fprintf('recovered gold = @(f_rate) f0(f_rate)*0.6*collected_gold(f_rate)\n');

%% (ii) Find maximum
%with pick:
%finding derivative of collected gold function
%dGp_df=@(f_rate) avg_gold(2)*180./(110.*f_rate+3).^2;
%optimising the problem - finding where the derivative is zero
%[root1c1,it]=modisecant(dGp_df,1,0.1,1e-10);

%without pick:
%finding derivative of collected gold function
%dGnp_df=@(f_rate) avg_gold(2)*
%optimising the problem - finding where the derivative is zero
%[root1c1,it]=modisecant(dGn_df,1,0.1,1e-10);


%fprintf('The ideal conditions are:\n');
%% (iii) Determine final gold haul

%fprintf('The final weight of gold is:\n');