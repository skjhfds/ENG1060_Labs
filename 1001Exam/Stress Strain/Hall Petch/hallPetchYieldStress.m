function s = hallPetchYieldStress(c1,c2,d)
%
% s = hallPetchYieldStress(c1,c2,d)
% Takes Hall Petch constants, grain diameter and stress
%
% Input arguments
% -----------------
%   c1 Constant 1 (MPa * sqrt(m))
%   c2 Constant 2 (MPa)
%    d grain diameter
% Outputs
% -----------------
%    s yield stress of metal
%
s = c1 + c2 / sqrt(d);
fprintf(' hallPetchYieldStress()\n============================\n')
fprintf('Equations:\n    s = c1 + c2 / sqrt(d)')