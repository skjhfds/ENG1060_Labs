clc; clear; close all
addpath(genpath('../1001Exam')); % load all folders
resultantBeamArray([triangleLoad(4,2);trapLoad(6,2,10,4);30,4+6+2],[],[20])