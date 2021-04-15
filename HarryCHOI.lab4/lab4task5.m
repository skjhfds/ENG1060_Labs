% Harry Choi 32464223
% 1-april-2021
% Lab 4 Task 5
close all; clc; clear

%import data
M = importdata('ENG1060studentmarks.txt').data;
id = 21245684;
sd = M(M(1,:)==id,:); %student data
[fm,lg] = markscalc(sd(2:11),sd(12),sd(13),sd(14));
fprintf('Student with ID number %.0f obtained a final mark of %.0f corresponding to a %s grade',id,fm,lg)