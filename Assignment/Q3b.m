% Q3b

%
% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 18th May 2021

fprintf('\n  Q3b\n===================================\n')

%% code starts here
%% (i) Define equations

g(1)=y3a1(7)-y3a1(1);
g(2)=y3a1(13)-y3a1(7);
avg_gold2=sum(g)/2;

num_buckets=@(f_rate) 4*60./(3/5+6./f_rate);
collected_gold=@(f_rate) avg_gold2*num_buckets(f_rate);
recovered_gold=@(f_rate) sluice_recov(f_rate)/100.*collected_gold(f_rate);

dom3b=0:0.1:7;
figure(8) %figure 8
plot(dom3b,recovered_gold(dom3b))
title('site 3: recovered gold vs sluice feed rate')
xlabel('sluice feed rate (shovels/min)')
ylabel('gold recovered (g)')

fprintf('The equations used are:\n');
fprintf('num_buckets = 240/(3/5+6/feed_rate)\n');
fprintf('collected_gold = avg_gold2*num_buckets(feed_rate)\n');
fprintf('recovered_gold = sluice)recov(feed_rate)/100*collected_gold\n\n');

%% (ii) Find maximum
%finding derivative of collected gold function
E=@(f_rate) exp(a0+a1.*f_rate);
comp_3=@(f_rate) 1440*avg_gold2./((3/5+6./f_rate).^2.*(f_rate.^2).*(E(f_rate)+1));
comp_4=@(f_rate) 240*avg_gold2*a1*E(f_rate)./((3/5)+(6./f_rate).*(E(f_rate)+1).^2);
dG3_df=@(f_rate) comp_3(f_rate)-comp_4(f_rate);

%optimising the problem - finding where the derivative is zero
[root3b,it]=modisecant(dG3_df,1,0.1,1e-10);

fprintf('The ideal conditions are: digging to every depth with a sluice feed rate of %.2f shovels/min\n\n',root3b);

%% (iii) Determine final gold haul
final_num2=num_buckets(root3b);
final_collected2=avg_gold2*final_num2;
final_recovered2=sluice_recov(root3b)/100.*final_collected2;

fprintf('Having found the optimal feed rate, this value is then substituted into the recovered_gold function\n')
fprintf('for gold recovery vs feed rate to find the final weight of gold: %.2fg.\n\n',final_recovered2)
