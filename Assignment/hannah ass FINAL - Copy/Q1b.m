% Q1b
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 7-May-2021

fprintf('\n Q1b\n======================================================\n')

%% Import Data
lG1=length(G1); 
x=0:240; % Domain, number of shovels to be plotted

%% Method 1: Surface
y1=G1(1).*x;

%% Method 2: Every Shovel
y2=zeros(1,length(x));
a=2:9; 
for i=2:(length(x)/8)+1 
    for j=1:8
        y2(a(j))=G1(j)+y2(a(j)-1); 
    end
    a=a+8;
end 

%% Method 3: Specific Depth
y3=zeros(7,length(x)); %pre-allocating
a=2:8;
for i=2:length(x)
    for b=1:7
        if rem(i-1,a(b))==0 
           y3(b,i)=y3(b,i-1)+G1(a(b));
        else
           y3(b,i)=y3(b,i-1);
        end
    end
end
% Generate Strings for Legend
legendStr=strings(1,lG1+1); %pre-allocating
legendStr(1)='Method 1/Method 3 (depth=7cm)';
legendStr(2)='Method 2';
for i = 2:lG1
    legendStr(i+1) = sprintf('Method 3 (depth=%gcm)',D(i,2));
end

%% Plot Data
figure(3)
plot(x,y1,'--',x,y2,'--',x,y3)
title('(Site 1) Gold Mass Collected against Total Digging Time')
xlabel('Total Digging Time (Shovels)')
ylabel('Gold Mass Collected (g)')
legend(legendStr,'location','best outside')

%% Method Breakdown per Bucket
spb=6; % Shovels per Bucket
method=strings([1,lG1+1]);
method(1:2)=["1,3(7cm)","2      "];

avg_gold=zeros(1,lG1+1);  
avg_gold(1)=spb*f1a(1); %average gold for method 1

for k=1:4 %average gold for method 2 (4-bucket cycle)
    b(k)=y2(k*6+1)-y2(k*6-5);
end
avg_gold(2)=sum(b)/4; 

% Average gold and shovels for method 3
avg_shovels=zeros(1,lG1+1); 
avg_shovels(1:2)=[6,6];
for i=2:lG1
    method(i+1)=sprintf('3(%gcm)',D(i,2));
    avg_gold(i+1)=spb*f1a(D1(i));
    avg_shovels(i+1)=i*spb;
end

%% Print Output
fprintf('Figure 3: (Site 1) Gold Mass Collected against Total Digging Time')
fprintf('Method breakdown per bucket\n')
fprintf('Method      Avg gold (g)     Avg shovel loads\n')
fprintf('%-s%10.4f%13g\n',[method(1);avg_gold(1);avg_shovels(1)])
fprintf('%-s%11.4f%13g\n',[method(2:end);avg_gold(2:end);avg_shovels(2:end)])

fprintf('\nComment on Q1b: is there a maximum?\n')
fprintf('Method 2 (using every shovel) produces the highest yield of gold.\n')