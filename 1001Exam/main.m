clc; clear; close all
addpath(genpath('../1001Exam')); % load all folders
a = [];
for l = [0,2,4,5,6,8,10]
    a(length(a)+1)=simpleBeam(10,80/100,l);
end
a