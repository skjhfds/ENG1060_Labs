clear; close all; clc
D = importdata('linsys.txt');
iter =0
for i = 1:300
    p = D(i,i);
    if mod(round(p),5)==0
        t = D(i+1:300,i);
        if length(t) ==0
            fprintf('what')
            continue
        end
        [m,MI] = max(t);
        Dt = D(i,:);
        D(i,:) = D(i+MI,:);
        D(MI,:) = Dt;
        iter = iter +1;
    end
    for j = i+1:300
        r0 = D(i,:);
        r1 = D(j,:);
        m = r1(i)/p;
        D(j,:) = r1-m*r0;
    end
end
iter