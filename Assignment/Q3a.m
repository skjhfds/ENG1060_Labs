% Q3a
% Name :Harry Choi
% ID   :32464223
% Date Modified : 12 May 2021

fprintf('\n  Q3a\n===================================\n')

%% first subplot (data)
data3=importdata('Site3_depth_profile.csv').data; %importing data
G3=data3(:,3);
D3=data3(:,2);

[d0,d1]=linreg(D3(2:end),log(G3(2:end))); %fitting a curve
f3a=@(x) exp(d0).*exp(d1.*x);

figure(7) %figure 7
subplot(2,1,1);
plot(D3,G3,'--',D3,f3a(D3))
title('site 3: weight of gold per shovel vs depth')
xlabel('depth (cm)')
ylabel('weight of gold (g)')
legend('data','fitted function (exponential)','location','best')

%% method 1: dig straight down and keep every shovel
su=240; %su = shovel units; setting a value
x3a=0:su; %domain

y3a1=zeros(1,length(x3a));
a=2:13;
for i=2:(length(x3a)/12)+1
    for j=1:12
        y3a1(a(j))=G3(j)+y3a1(a(j)-1);
    end
    a=a+12;
end 

%% method 2: dig to a specific depth
y3a2=zeros(12,length(x3a)); %pre-allocating

a=1:12;
for i=2:length(x3a)
    for b=1:12
        if rem(i-1,a(b))==0
            y3a2(b,i)=y3a2(b,i-1)+G3(a(b));
        else
            y3a2(b,i)=y3a2(b,i-1);
    end
    end
end

method3a=strings([1,length(G3)]);
method3a(1)='method 1';
for i=2:length(G3)
    method3a(i)=sprintf('method 2 (depth=%gcm)',D3(i));
end

%% second subplot (methods)
subplot(2,1,2)
plot(x3a,y3a1,x3a,y3a2)
title('site 3: gold mass collected vs digging time')
xlabel('digging time (shovels)')
ylabel('total gold collected (g)')
legend(method3a,'location','east outside')

fprintf('The best strategy is digging to every depth.\n\n');