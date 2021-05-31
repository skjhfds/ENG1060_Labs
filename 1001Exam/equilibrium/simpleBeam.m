function [lr,rr]=simpleBeam(L,m,x)
%
% [lr,rr]=simpleBeam(l,m,x)
% Takes the length of a simply supported beam,
% mass of object on beam and distance from left support
% to calculate the reactions in each support.
%
% Input arguments
% -----------------
%   L length of beam
%   m mass of object on beam
%   x distance from left support
% Output arguments
% -----------------
%  lr left support reaction
%  rr right support reaction
% 
% ----x---->0
%          /|\  m
%          / \
% =======================
% A                     O
% <---------l----------->
%

