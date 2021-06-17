clc; clear; close all
addpath(genpath('../1001Exam')); % load all folders
% If loading varies, give multiple different loads
% For Buckling, use Effective Length Table
dydx = @(x) x+1;
d2ydx2 = @(x) x+2;
radiusOfCurvature(dydx,d2ydx2,1)