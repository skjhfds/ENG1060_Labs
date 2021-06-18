function F = yieldingLoad(A,y)
%function F = yieldingLoad(A,y)
%
%takes the desired applied force on a member and the 
%yield stress of a material
%
%inputs: 
% - y: yield stress (MPa)
% - A: cross-sectional area (mm^2)
%outputs:
% - F: maximum force (N)

F = A*y;

fprintf('     yieldingLoad()\n=========================\n\n')
fprintf('Equations:\n    F = A*y')