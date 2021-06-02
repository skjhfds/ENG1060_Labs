clc; clear; close all;
addpath(genpath('../1001Exam')); % load all folders

I=3.1415*35^4/4;
F=bucklingLoad(70000,I,6000);