function s = beamBendingStress(M,y,I)
%function I = beamBendingStress(M,y,I)
%
%takes the desired internal moment in the beam, second moment of area,
%and distance from the neutral axis and calculates the required 
%bending stress
%
%inputs:
% - M: internal moment in the beam (Nmm)
% - y: distance from neutral axis (mm)
% - I: second moment of area (mm^4)
%
%outputs:
% - s: bending stress (MPa)

s=M*y/I;
fprintf(' beamBendingStress()\n======================\n')
fprintf('Equations:\n    \x03c3 = My/I\n      = %g*%g / %g\n      = %g MPa\n',M,y,I,s)