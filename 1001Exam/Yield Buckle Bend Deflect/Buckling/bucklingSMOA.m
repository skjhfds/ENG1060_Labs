function I = bucklingSMOA(F,E,Le)
%function [I,A] = bucklingSMOA(F,E,Le)
%
%takes the desired applied force, Young's Modulus of the material,
%and the effective length of the beam and calculates the 
%minimum second moment of area to withstand the loading
%
%inputs:
% - F: applied force (N)
% - E: Young's Modulus (MPa)
% - Le: effective length (mm)
%
%outputs:
% - I: minimum second moment of area

I = F*Le^2/(E*pi()^2); %rearrange formula

fprintf('    bucklingSMOA()\n=========================\n\n')
fprintf('Equations:\n    %g <= pi^2*%g*I / %g^2\n    I >= %g*%g^2 / pi^2*%g\n    I >= %g mm^4\n\n',F,E,Le,F,Le,E,I)