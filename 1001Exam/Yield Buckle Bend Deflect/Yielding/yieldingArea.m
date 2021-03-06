function A = yieldingArea(F,y)
%function A = yieldingArea(F,y)
%
%takes the desired applied force on a member and the 
%yield stress of a material and calculates the minimum 
%cross-sectional area to withstand the loading
%
%inputs: 
% - F: applied force (N)
% - y: yield stress (MPa)
%
%outputs:
% - A: minimum area (mm^2)

A = F/y; %rearrange formula

fprintf('     yieldingArea()\n=========================\n\n')
fprintf('Equations:\n    %g <= A*%g\n    A >= %g mm^2\n',F,y,A)