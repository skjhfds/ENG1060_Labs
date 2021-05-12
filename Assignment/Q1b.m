% Q1b
% ====================================
% Name :Harry Choi
% ID   :324spb4223
% Date Modified : 12 May 2021
% ------------------------------------
% Deposit 1
% Plot gold in bucket vs digging time
% Time is in seconds

% Task Title
fprintf('\n  Q1b\n===================================\n')

% Import data
Data = importdata('Site1_depth_profile.csv').data;
D = Data(:,3);
LD = length(D);
spb = 6;  % shovels per bucket
sps = 60; % seconds per shovel
jts = 40; % journey to  sluice

% Domain
ly = 1:spb*prod(factor(LD)); % number of shovellings

% Gold per Time
% - Strategy i: Only dig surface
siy = ly;
six = sps*ly;
for i = siy
    j = mod(siy(i),spb);
    if j == 0
        siy(i) = spb*D(1);
        six(i+1:end) = six(i+1:end)+jts;
    else
        siy(i) = j*D(1);
    end
end
siy = [0,siy];
six = [0,six];
% - Strategy ii: Dig straight down
siiy = ly;
siiy(1) = D(1);
siix = sps*ly;
for i = siiy(2:end)
    if mod(siiy(i)-1,spb)==0
        p = 0;
        siix(i:end) = siix(i:end)+jts;
    else
        p = siiy(i-1);
    end
    j = mod(i,LD);
    if j == 0
        siiy(i) = p+D(end);
    else
        siiy(i) = p+D(j);
    end
end
siiy = [0,siiy];
siix = [0,siix];
% - Strategy iii: Dig to specific depth
siiiy = zeros(LD-1,length(ly));
siiix = sps*ly;
for i = 2:LD
    p = 0;
    b = 0;
    for j = ly
        if b == spb
            b = 0;
            p = 0;
            siiix(j:end) = siiix(j:end)+jts;
        end
        if mod(j,i) == 0
            siiiy(i-1,j) = p+D(i);
            p = siiiy(i-1,j);
            b = b + 1;
        else
            siiiy(i-1,j) = p;
        end
    end
end
siiiL=strings([1,LD-1]);
for i = 2:LD
    siiiL(i-1) = sprintf('Strategy 3 (Depth=%gcm)',Data(i,2));
end
siiiy = [zeros(LD-1,1),siiiy];
siiix = [0,siiix];

% Plot
clf(figure(3))
figure(3)  %figure 3
plot(six,siy,'--'); hold on
plot(siix,siiy,'--')
plot(siiix,siiiy)
title("Gold Mass Collected in Bucket vs Total Digging Time (Shovel)")
xlabel("Total Digging Time (Seconds)")
ylabel("Gold Mass Collected in Bucket (g)")
legend(["Stragegy 1 / Strategy 3 (Depth=7cm)","Stragegy 2",siiiL],"Location","eastoutside")

% Strategy Breakdown per Bucket
sstr = strings([1,LD+1]);
sstr(1:2) = ["1,3(7cm)","2      "];
aveG = zeros(1,LD+1);
aveG(1) = spb*D(1);
aveG(2) = mean(siiy(7:6:lcm(spb,LD)+1)); % big brain time
aveS = zeros(1,LD+1);
aveS(1:2) = [6,6];
for i = 2:LD
    sstr(i+1) = sprintf('3(%gcm)',Data(i,2));
    aveG(i+1) = spb*D(i);
    aveS(i+1) = i*spb;
end

% Print output
fprintf(' Strategy Breakdown per Bucketful\n----------------------------------\n')
fprintf('Strategy     Ave. Gold(g)    Ave. Shovel-Loads\n')
fprintf('%8s      %.3f           %g\n',[sstr;aveG;aveS])
% fprintf('Comment on Q1b: is there a maximum?\n');
