% Q1b

% Name : Hannah Tay
% ID   : 32521987
% Date Modified : 7th May 2021

fprintf('\n Q1b \n\n')

%% defining variables

data1b=importdata('Site1_depth_profile.csv').data; %importing data
G1=data1b(:,3); %extracting gold column
lG=length(G1);

su=240; %su = shovel units; setting a value
x1b=0:su; %domain

%% method 1: only digging surface
y1b1=G1(1).*x1b; %gold per shovel is the same every time

%% method 2: digging straight down
y1b2=zeros(1,length(x1b));
a=2:9;
for i=2:(length(x1b)/8)+1
    for j=1:8;
        y1b2(a(j))=G1(j)+y1b2(a(j)-1);
    end
    a=a+8;
end 

%% method 3: digging to a specific depth
y1b3=zeros(7,length(x1b)); %pre-allocating

%depth 2
for i2=2:length(x1b)
    if rem(i2-1,2)==0
        y1b3(1,i2)=y1b3(1,i2-1)+G1(2);
    else
        y1b3(1,i2)=y1b3(1,i2-1);
    end
end

%depth 3
for i3=2:length(x1b)
    if rem(i3-1,3)==0
        y1b3(2,i3)=y1b3(2,i3-1)+G1(3);
    else
        y1b3(2,i3)=y1b3(2,i3-1);
    end
end

%depth 4
for i4=2:length(x1b)
    if rem(i4-1,4)==0
        y1b3(3,i4)=y1b3(3,i4-1)+G1(4);
    else
        y1b3(3,i4)=y1b3(3,i4-1);
    end
end

%depth 5
for i5=2:length(x1b)
    if rem(i5-1,5)==0
        y1b3(4,i5)=y1b3(4,i5-1)+G1(5);
    else
        y1b3(4,i5)=y1b3(4,i5-1);
    end
end

%depth 6
for i6=2:length(x1b)
    if rem(i6-1,6)==0
        y1b3(5,i6)=y1b3(5,i6-1)+G1(6);
    else
        y1b3(5,i6)=y1b3(5,i6-1);
    end
end

%depth 7
for i7=2:length(x1b)
    if rem(i7-1,7)==0
        y1b3(6,i7)=y1b3(6,i7-1)+G1(7);
    else
        y1b3(6,i7)=y1b3(6,i7-1);
    end
end

%depth 8
for i8=2:length(x1b)
    if rem(i8-1,7)==0
        y1b3(7,i8)=y1b3(7,i8-1)+G1(8);
    else
        y1b3(7,i8)=y1b3(7,i8-1);
    end
end

method1b=strings(1,lG+1);
method1b(1)='method 1/method 3 (depth=7cm)';
method1b(2)='method 2';
for i = 2:lG
    method1b(i+1) = sprintf('method 3 (depth=%gcm)',data1b(i,2));
end

%% plotting
figure(3) %figure 3
plot(x1b,y1b1,'--',x1b,y1b2,'--',x1b,y1b3)
title('site 1: gold mass collected vs total digging time')
xlabel('total digging time (shovel units)')
ylabel('gold mass collected (grams)')
legend(method1b,'location','best outside')

%% method breakdown per bucket
num_shovels=6; %6 shovels per bucket
method=strings([1,lG+1]);
method(1:2)=["1,3(7cm)","2      "];
avg_gold=zeros(1,lG+1);
avg_gold(1)=num_shovels*G1(1);

for k=1:4
    b(k)=y1b2(k*6+1)-y1b2(k*6-5);
end

avg_gold(2)=sum(b)/4;
avg_shovels=zeros(1,lG+1);
avg_shovels(1:2)=[6,6];
for i=2:lG
    method(i+1)=sprintf('3(%gcm)',data1b(i,2));
    avg_gold(i+1)=num_shovels*G1(i);
    avg_shovels(i+1)=i*num_shovels;
end

%% printing
fprintf('method breakdown per bucket\n')
fprintf('method      avg gold (g)     avg shovel loads\n')
fprintf('%-s%10.4f%13g\n',[method(1);avg_gold(1);avg_shovels(1)])
fprintf('%-s%11.4f%13g\n',[method(2:end);avg_gold(2:end);avg_shovels(2:end)])

fprintf('\nComment on Q1b: is there a maximum?\n');
fprintf('Method 2 produces the highest yield of gold.\n');