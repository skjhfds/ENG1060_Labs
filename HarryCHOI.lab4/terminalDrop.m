function [vt, yt] = terminalDrop(m, k, n)
%
% [vt, yt] = terminalDrop(m, k, n)
% Written by: Harry Choi, 32464223
% Created on 1-Apr-2021
% The terminalDrop function takes object's mass,
% drag parameter and fractional factor to calculate
% its terminal velocity and distance it falls until
% terminal velocity.
% 
% Input arguments
% -----------------
%   m the mass of falling object
%   k the drag parameter of object
%   n fractional factor
%
% Output arguments
% -----------------
%  vt terminal velocity of object
%  yt distance object falls until terminal velocity
%
g = 9.81;
vt = sqrt(m.*g./k);
yt = m./2./k.*log(m.*g./(m.*g-k.*(n.*vt.^2)));