function y = DistFromNeutral(M,I,s)
%function I = DistFromNeutral(M,y,s)
%
%takes the desired internal moment in the beam, bending stress,
%and distance from the neutral axis and calculates the required 
%second moment of area
%
%inputs:
% - M: internal moment in the beam (Nmm)
% - y: distance from neutral axis (mm)
% - s: bending stress (MPa)
%
%outputs:
% - I: second moment of area (mm^4)

y = s*I/M; %rearrange formula

fprintf(' DistFromNeutral()n\======================\n')
fprintf('Equations:\n    y = s*I/M')