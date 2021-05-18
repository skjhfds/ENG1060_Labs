% Q3a
% Name :Harry Choi
% ID   :32464223
% Date Modified : 12 May 2021

fprintf('\n  Q3a\n===================================\n')

clc; %DELETE

%% first subplot (data)
data3=importdata('Site3_depth_profile.csv').data; %importing data
G3=data3(:,2);
D3=data3(:,3);

[c0,c1,r2_3]=linreg(G3(2:end),log(D3(2:end))); %fitting 
f3a=@(x) exp(c0).*exp(c1.*x);

figure(5);
subplot(2,1,1);
plot(G3,D3,'--',G3,f3a(G3))
title('site 3: weight of gold per shovel vs depth')
xlabel('depth (cm)')
ylabel('weight of gold (g)')
legend('data','fitted function (exponential)','location','best')

%% method 1: dig straight down and keep every shovel
su=240; %su = shovel units; setting a value
x3a=0:su; %domain

y3a1=zeros(1,length(x3a));
a=2:9;
for i=2:(length(x3a)/8)+1
    for j=1:8
        y3a1(a(j))=G3(j)+y3a1(a(j)-1);
    end
    a=a+8;
end 

%% method 2: dig to a specific depth
y3a2=zeros(12,length(x3a)); %pre-allocating

%depth 1
for q1=2:length(x3a)
    if rem(q1-1,1)==0
        y3a2(1,q1)=y3a2(1,q1-1)+G3(1);
    else
        y3a2(1,q1)=y3a2(1,q1-1);
    end
end

%depth 2
for q2=2:length(x3a)
    if rem(q2-1,2)==0
        y3a2(2,q2)=y3a2(2,q2-1)+G3(2);
    else
        y3a2(2,q2)=y3a2(2,q2-1);
    end
end

%depth 3
for q3=2:length(x3a)
    if rem(q3-1,3)==0
        y3a2(3,q3)=y3a2(3,q3-1)+G3(3);
    else
        y3a2(3,q3)=y3a2(3,q3-1);
    end
end

%depth 4
for q4=2:length(x3a)
    if rem(q4-1,4)==0
        y3a2(4,q4)=y3a2(4,q4-1)+G3(4);
    else
        y3a2(4,q4)=y3a2(4,q4-1);
    end
end

%depth 5
for q5=2:length(x3a)
    if rem(q5-1,5)==0
        y3a2(5,q5)=y3a2(5,q5-1)+G3(5);
    else
        y3a2(5,q5)=y3a2(5,q5-1);
    end
end

%depth 6
for q6=2:length(x3a)
    if rem(q6-1,6)==0
        y3a2(6,q6)=y3a2(6,q6-1)+G3(6);
    else
        y3a2(6,q6)=y3a2(6,q6-1);
    end
end

%depth 7
for q7=2:length(x3a)
    if rem(q7-1,7)==0
        y3a2(7,q7)=y3a2(7,q7-1)+G3(7);
    else
        y3a2(7,q7)=y3a2(7,q7-1);
    end
end

%depth 8
for q8=2:length(x3a)
    if rem(q8-1,8)==0
        y3a2(8,q8)=y3a2(8,q8-1)+G3(8);
    else
        y3a2(8,q8)=y3a2(8,q8-1);
    end
end

%depth 9
for q9=2:length(x3a)
    if rem(q9-1,9)==0
        y3a2(9,q9)=y3a2(9,q9-1)+G3(9);
    else
        y3a2(9,q9)=y3a2(9,q9-1);
    end
end

%depth 10
for q10=2:length(x3a)
    if rem(q10-1,10)==0
        y3a2(10,q10)=y3a2(10,q10-1)+G3(10);
    else
        y3a2(10,q10)=y3a2(10,q10-1);
    end
end

%depth 11
for q11=2:length(x3a)
    if rem(q11-1,11)==0
        y3a2(11,q11)=y3a2(11,q11-1)+G3(11);
    else
        y3a2(11,q11)=y3a2(11,q11-1);
    end
end

%depth 12
for q12=2:length(x3a)
    if rem(q12-1,12)==0
        y3a2(12,q12)=y3a2(12,q12-1)+G3(12);
    else
        y3a2(12,q12)=y3a2(12,q12-1);
    end
end

method3a=strings([1,length(G3)]);
method3a(1)='method 1';
for i=2:length(G3)
    method3a(i)=sprintf('method 2 (depth=%gmm)',D3(i)*10^3);
end

%% second subplot (methods)
subplot(2,1,2)
plot(x3a,y3a1,'--',x3a,y3a2)
title('site 3: gold mass collected vs digging time')
xlabel('digging time (shovels)')
ylabel('total gold collected (g)')
legend(method3a,'location','east outside')

fprintf('The best strategy is method 1: digging straight down and taking every shovel load\n');