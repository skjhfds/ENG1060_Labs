function yc = neutralAxis(Ay)
%
% yc = neutralAxis(Ay,ASum)
% Finds the neutral axis of object being bent/buckled
%
% Input arguments
% -----------------
%    Ay Matrix with [individualArea,
%                    centroid relative to arbitrary line;]
%
% Outputs
% -----------------
%  yc Neutral axis relative to arbitrary line
%
A = Ay(:,1);
y = Ay(:,2);
yc = sum(A.*y) / sum(A);
fprintf('\nNeutral Axis\n====================\n    yc = sum(Ai * yi) / A\n    =%g\n',yc)