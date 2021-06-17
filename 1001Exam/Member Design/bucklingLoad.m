function F = bucklingLoad(E,I,L)
%function F = bucklingLoad()
%
%takes the Young's modulus, second moment of area, and effective length
%and calculates the buckling load (force)
%
%inputs:
% - E: Young's modulus of the material (MPa)
% - I: second moment of area of the member (mm^4)
% - L: effective length of the member (mm)
%
%outputs:
% - F: buckling load

F = pi()^2*E*I/(L^2);

%printing 
fprintf('   bucklingLoad()\n====================\nEquations:\n')
fprintf('    F = pi^2 * %g * %.2f / (%g)^2\n    F = %g kN\n',E,I,L,F/1000)
