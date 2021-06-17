function E = bucklingModulus(F,I,Le)
%function [I,A] = bucklingModulus(F,I,Le)
%
%takes the desired applied force, Young's Modulus of the material,
%
%inputs:
% - F: applied force (N)
% - I: minimum second moment of area
% - Le: effective length (mm)
%
%outputs:
% - E: Young's Modulus (MPa)

E = F*Le^2/(I*pi()^2); %rearrange formula

fprintf('    bucklingModulus()\n=========================\n\n')
fprintf('Equations:\n    E = F*Le^2/(I*pi()^2)')