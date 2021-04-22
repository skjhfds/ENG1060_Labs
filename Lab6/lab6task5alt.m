% Harry Choi 32464223
% 23-Apr-2021
% Lab 6 Task 5 Alternative Method using for loops
close all; clc; clear

nMax = 50;
A = 10:25;
B = 5:30;

n = 1:nMax;
p = zeros(length(A),length(B));

for a = A
    for b = B
        p(find(A==a),find(B==b)) = sum(a.^-n+n*abs(cos(b))^sin(a));
    end
end

% find minimum
p_min = min(min(p));
[r, c] = find(p==p_min);

% print result
fprintf('Smallest p value is %f at a=%.0f and b=%.0f',p_min,A(r),B(c))