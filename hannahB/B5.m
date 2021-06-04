clc; clear; close all;

%this took way too long to import
A=fileread('linsys.txt');
A=str2num(A);

%variables for Gaussian elimination
b=A(:,301);
A=A(:,1:300); 

[x,i]=gauss(A,b); %i is the number of times partial pivoting occurs
%required value: i