function d = hallPetchGrainDiameter(c1,c2,s)
%
% s = hallPetchGrainDiameter(c1,c2,d)
% Takes Hall Petch constants, grain diameter and stress
%
% Input arguments
% -----------------
%   c1 Constant 1 (MPa * sqrt(m))
%   c2 Constant 2 (MPa)
%    s yield stress of metal
% Outputs
% -----------------
%    d grain diameter
%
d = ( c2 / (s - c1) )^2;
fprintf(' hallPetchGrainDiameter()\n============================\n')
fprintf('Equations:\n    d = ( c2 / (s - c1) )^2')