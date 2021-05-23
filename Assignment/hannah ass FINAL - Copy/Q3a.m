% Q3a
% Name : Harry Choi
% ID   : 32464223
% Date Modified : 18-May-2021

fprintf('\n Q3a\n=====================================================\n')

%% first subplot (mass of gold vs depth)
D=importdata('Site3_depth_profile.csv').data;
G3=D(:,3);
D3=D(:,2);
    
% Fit Exponential Function to Data
[d0,d1]=linreg(D3(2:end),log(G3(2:end))); 
f3a=@(x) exp(d0).*exp(d1.*x);
figure(7)
subplot(2,1,1);
plot(D3,G3,'--',D3,f3a(D3))
title('(Site 3) Weight of Gold per Shovel against Depth from Surface')
xlabel('Depth from Surface(cm)')
ylabel('Weight of Gold (g)')
legend('Data','Fitted Function (Exponential)','Location','best')

%% Method 1: Every Shovel
x=0:240; %domain
y1=zeros(1,length(x)); %pre-allocating

a=2:13; %counter - 12 different depths
%after 12 shovels, we come back to the first depth
for i=2:(length(x)/12)+1
    for j=1:12
        y1(a(j))=f3a(j)+y1(a(j)-1);
    end
    a=a+12;
end 

%% Method 2: Specific Depth
y3a2=zeros(12,length(x));
a=1:12;
for i=2:length(x)
    for b=1:12
        if rem(i-1,a(b))==0
            y3a2(b,i)=y3a2(b,i-1)+f3a(a(b));
        else
            y3a2(b,i)=y3a2(b,i-1);
        end
    end
end
% Generate Strings for Legend
legendStr=strings([1,length(G3)]);
legendStr(1)='Method 1';
for i=2:length(G3)
    legendStr(i)=sprintf('Method 2 (depth=%gcm)',D3(i));
end

%% Second Subplot (Methods)
subplot(2,1,2)
plot(x,y1,x,y3a2)
title('(Site 3) Gold Mass Collected against Digging Time')
xlabel('Digging Time (shovels, 6s)')
ylabel('Total Gold Collected (g)')
legend(legendStr,'Location','east outside')

%% Print Output
fprintf('Figure 7,\nSubplot 1:(Site 3) Gold Mass Collected against Digging Time\nSubplot 2: (Site 3) Weight of Gold per Shovel against Depth from Surface\n')
fprintf('Best Method is digging straight down and keeping every shovel.\n')