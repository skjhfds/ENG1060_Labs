function Id = parallelAxis(Ic,m,x)
%
% Id = parallelAxis(Ic,m,x)
% Takes moment of inertia at center, mass of object and distance of
% point of rotation to center then outputs displaced moment of inertia
%
% Input arguments
% -----------------
%  Ic moment of inertia at center
%   m mass of object
%   x distance between point of rotation and center
% Outputs
% -----------------
%  Id displaced moment of inertia
%
fprintf('    parallelAxis()\n=========================\n\n')
fprintf('Equations:\n')
fprintf('     Id = Ic + m * x^2\n')
Id = Ic + m * x^2;
fprintf('        = %g\n',Id)