% Harry Choi 32464223
% 23-Apr-2021
% Lab 6 Task 2
close all; clc; clear

% import data
nums = importdata('numbers.txt');

% numbers ending in 3 or 7
d3 = logical(mod(nums,10)==3);
d7 = logical(mod(nums,10)==7);
fprintf('Numbers ending in 3 appear %.0f times and numbers ending in 7 appears %.0f times.\n',sum(d3),sum(d7))

% maximums
m3 = max(nums(d3));
m7 = max(nums(d7));
fprintf('The highest number ending in 3 is %.0f and it appears %.0f times.\n',m3,sum(logical(nums==m3)));
fprintf('The highest number ending in 3 is %.0f and it appears %.0f times.',m7,sum(logical(nums==m7)));
