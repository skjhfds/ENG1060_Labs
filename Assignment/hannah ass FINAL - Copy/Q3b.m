% Q3b
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 18-May-2021

fprintf('\n Q3b\n=====================================================\n')

%% (i) Define equations
g=zeros(1,2);
g(1)=sum(f3a(D3(1:6))); %average gold per bucket
g(2)=sum(f3a(D3(7:12)));
avg_gold2=mean(g);

nb=@(f_rate) 4*60./(3/5+6./f_rate); %number of buckets
cg=@(f_rate) avg_gold2*nb(f_rate); %total gold collected
rg=@(f_rate) sr(f_rate)/100.*cg(f_rate); %recovered gold

%plotting
x=0:0.1:7;
figure(8)
plot(x,rg(x))
title('(Site 3) Recovered Gold against Sluice Feed Rate')
xlabel('Sluice Feed Rate (shovels/min)')
ylabel('Gold Recovered (g)')

fprintf('Figure 8:(Site 3) Recovered Gold against Sluice Feed Rate\n\n')
fprintf('The equations used are:\n')
fprintf('Number of Buckets\nnb = 240/(3/5+6/feed_rate)\n')
fprintf('Total Gold Collected\ncg = avg_gold2*nb(feed_rate)\n')
fprintf('Recovered Gold\nrg = sr(feed_rate)/100.*cg(feed_rate)\n\n')

%% (ii) Find maximum
% Finding Derivative of collected gold function
E=@(f_rate) exp(a0+a1.*f_rate);
comp_3=@(f_rate) 1440*avg_gold2./((3/5+6./f_rate).^2.*(f_rate.^2).*(E(f_rate)+1));
comp_4=@(f_rate) 240*avg_gold2*a1*E(f_rate)./((3/5)+(6./f_rate).*(E(f_rate)+1).^2);
dG3_df=@(f_rate) comp_3(f_rate)-comp_4(f_rate);

% Optimise by solving root of derivative using Modified Secant
[root3b,it]=modisecant(dG3_df,1,0.1,1e-10);

fprintf('The ideal conditions are: digging to every depth with a sluice feed rate\nof %.2f shovels/min\n\n',root3b)

%% (iii) Determine Final Gold Haul
final_num2=nb(root3b);
final_collected2=avg_gold2*final_num2;
final_recovered2=sr(root3b)/100.*final_collected2;

fprintf('Under these conditions, Final Gold Haul: %.2fg.\n\n',final_recovered2)