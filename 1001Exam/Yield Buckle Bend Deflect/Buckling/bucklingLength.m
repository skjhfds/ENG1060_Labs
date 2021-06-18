function Le = bucklingLength(F,I,E)
%function Le = bucklingLength(F,I,E)
%takes the desired applied force, Young's Modulus of the material,
%
%inputs:
% - F: applied force (N)
% - I: minimum second moment of area
% - E: Young's Modulus (MPa)
%
%outputs:
% - Le: effective length (mm)

Le = sqrt( ( E*I*pi()^2 )/F ); %rearrange formula

fprintf('    bucklingLength()\n=========================\n\n')
fprintf('Equations:\n    Le = sqrt( ( E*I*pi()^2 )/F )')