clear; clc; close all

n = 1:3;
a = 1:4;
ea = a'*ones(1,length(n));
en = ones(length(a),1)*n;

ea.^en

ea.^en*ones(length(n),1)