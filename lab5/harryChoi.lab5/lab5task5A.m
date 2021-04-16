% Harry Choi 32464223
% 15-Apr-2021
% Lab 5 Task 5 Part A
close all; clc; clear

a=5;
b=8;

% initialise 10 term array with first two numbers
fSeq = zeros(1,10);
fSeq(1:2) = [a,b];

% create Fibonacci sequence
for i = 3:length(fSeq)
    fSeq(i) = sum(fSeq(i-2:i-1));
end

% print sequence using %s instead of %.0f
fprintf('Fibonacci sequence with starting numbers [%.0f, %.0f] is\n',a,b)
fprintf(' %s',num2str(fSeq))