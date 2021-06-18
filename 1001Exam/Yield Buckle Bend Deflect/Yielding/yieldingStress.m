function F = yieldingStress(A,y)
%function F = yieldingArea(A,y)
%
%takes the desired applied force on a member and the 
%yield stress of a material
%
%inputs: 
% - F: maximum force (N)
% - A: cross-sectional area (mm^2)
%outputs:
% - y: yield stress (MPa)


A = F/y;

fprintf('     yieldingStress()\n=========================\n\n')
fprintf('Equations:\n    A = F/y')