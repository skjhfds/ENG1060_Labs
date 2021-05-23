% Q1c
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 13-May-2021

fprintf('\n Q1c\n======================================================\n')

%% (i) Define equations

%% With Pick
% number of buckets collected
num_buckets_p=@(f_rate) 200./(3+(2/3)+(6./f_rate));
% amount of gold collected
collected_gold_p=@(f_rate) avg_gold(2)*num_buckets_p(f_rate); 
% amount of gold recovered
recovered_gold_p=@(f_rate) sr(f_rate)/100.*collected_gold_p(f_rate); 

%% Without Pick
% number of buckets collected
num_buckets_np=@(f_rate) 240./(6+(2/3)+(6./f_rate));
% amount of gold collected
collected_gold_np=@(f_rate) avg_gold(2)*num_buckets_np(f_rate);
% amount of gold recovered
recovered_gold_np=@(f_rate) sr(f_rate)/100.*collected_gold_np(f_rate);

%% Print Output
dom1c=0:0.1:7;
figure(4)
plot(dom1c,recovered_gold_p(dom1c),dom1c,recovered_gold_np(dom1c))
title('site 1: gold recovered vs sluice feed rate')
xlabel('sluice feed rate (shovels/min)')
ylabel('gold recovered (g)')
legend('with pick','without pick','location','best')

fprintf('From figure 4, it can be seen that using a pick yields more gold.\n\n')
fprintf('The equations used are:\n')
fprintf('number of buckets = @(f_rate) 240/(6+(2/3)+6/f_rate)\n')
fprintf('collected gold = @(f_rate) avg_gold(2)*number_of_buckets(f_rate)\n')
fprintf('recovered gold = @(f_rate) sr(f_rate)/100*collected_gold(f_rate)\n\n')

%% (ii) Find maximum
% With Pick
% Derivative of collected gold function
E=@(f_rate) exp(a0+a1.*f_rate);
comp_1=@(f_rate) 1440*avg_gold(2)./((20/3+6./f_rate).^2.*(f_rate.^2).*(E(f_rate)+1));
comp_2=@(f_rate) 240*avg_gold(2)*a1*E(f_rate)./((20/3)+(6./f_rate).*(E(f_rate)+1).^2);
dG_df=@(f_rate) comp_1(f_rate)-comp_2(f_rate);
% Optimise by solve for roots of derivative using modified secant
[root1c,it]=modisecant(dG_df,1,0.1,1e-10);
fprintf('The ideal conditions are: using a pick, digging to every depth, with a feed\nrate of %.2f shovels per minute.\n\n',root1c)

%% (iii) Determine final gold haul
%substituting the above root into previous equations
final_num=num_buckets_p(root1c);
final_collected=avg_gold(2)*final_num;
final_recovered=sr(root1c)/100.*final_collected;
fprintf('Under these conditions, final gold haul: %.2fg.\n\n',final_recovered)