function I = beamDesign(M,y,s)
%function I = beamDesign(M,y,s)
%
%takes the desired internal moment in the beam, bending stress,
%and distance from the neutral axis and calculates the required 
%second moment of area
%
%inputs:
% - M: internal moment in the beam (Nmm)
% - y: distance from neutral axis (mm)
% - s: bending stress (MPa)
%
%outputs:
% - I: second moment of area (mm^4)

I = M*y/s; %rearrange formula

fprintf('beamDesign()===================\n')
fprintf('Equations:\n    %g = %g*%g / I\n    I = %g*%g / %g\n    I = %g mm^4\n',s,M,y,M,y,s,I)