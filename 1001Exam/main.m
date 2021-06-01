clc; clear; close all
addpath(genpath('../1001Exam')); % load all folders

fx=-10-20*cos(30*pi/180)
fy = -20*sin(30*pi/180)
sumZ = 10*2-15-20*sin(30*pi/180)*3+20*cos(30*pi/180)

sumZ/fy

hypot(fx,fy)
atan(fy/fx)*180/pi