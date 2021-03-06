% Q1b

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q1b\n===================================\n')

%% defining variables

data1b=importdata('Site1_depth_profile.csv').data; %importing data
G1=data1b(:,3); 
lG1=length(G1);

su=240; %su = shovel units; assuming a value
x1b=0:su; %domain

%% method 1: only digging surface
y1b1=G1(1).*x1b; %gold per shovel is the same every time

%% method 2: digging straight down
y1b2=zeros(1,length(x1b)); %pre-allocating

a=2:9; %counter - 8 different depths
%after 8 shovels, we come back to the first depth
for i=2:(length(x1b)/8)+1 
    for j=1:8;
        y1b2(a(j))=G1(j)+y1b2(a(j)-1); 
    end
    a=a+8;
end 

%% method 3: digging to a specific depth
y1b3=zeros(7,length(x1b)); %pre-allocating

a=2:8; %first counter - 7 different depths since depth 1 is covered in method 1
for i=2:length(x1b)
    for b=1:7 %second counter - stepping through each depth
        if rem(i-1,a(b))==0 %if the correct depth is reached, gold is added
           y1b3(b,i)=y1b3(b,i-1)+G1(a(b));
        else %if the depth is incorrect, the shovel is discarded
           y1b3(b,i)=y1b3(b,i-1);
    end
    end
end

%creating strings for plotting
method1b=strings(1,lG1+1); %pre-allocating
method1b(1)='method 1/method 3 (depth=7cm)';
method1b(2)='method 2';
for i = 2:lG1
    method1b(i+1) = sprintf('method 3 (depth=%gcm)',data1b(i,2));
end

%% plotting
figure(3) %figure 3
plot(x1b,y1b1,'--',x1b,y1b2,'--',x1b,y1b3)
title('site 1: gold mass collected vs total digging time')
xlabel('total digging time (shovels)')
ylabel('gold mass collected (g)')
legend(method1b,'location','best outside')

%% method breakdown per bucket
num_shovels=6; %6 shovels per bucket
method=strings([1,lG1+1]); %method strings
method(1:2)=["1,3(7cm)","2      "];

avg_gold=zeros(1,lG1+1);  
avg_gold(1)=num_shovels*G1(1); %avergae gold for method 1

for k=1:4 %average gold for method 2 (4-bucket cycle)
    b(k)=y1b2(k*6+1)-y1b2(k*6-5);
end
avg_gold(2)=sum(b)/4; 

%finding average gold and shovels for method 3
avg_shovels=zeros(1,lG1+1); 
avg_shovels(1:2)=[6,6];
for i=2:lG1
    method(i+1)=sprintf('3(%gcm)',data1b(i,2));
    avg_gold(i+1)=num_shovels*G1(i);
    avg_shovels(i+1)=i*num_shovels;
end

%% printing
fprintf('Method breakdown per bucket\n')
fprintf('Method      Avg gold (g)     Avg shovel loads\n')
fprintf('%-s%10.4f%13g\n',[method(1);avg_gold(1);avg_shovels(1)])
fprintf('%-s%11.4f%13g\n',[method(2:end);avg_gold(2:end);avg_shovels(2:end)])

fprintf('\nComment on Q1b: is there a maximum?\n');
fprintf('Method 2 (digging to every depth) produces the highest yield of gold,\nas shown in figure 2.\n\n');