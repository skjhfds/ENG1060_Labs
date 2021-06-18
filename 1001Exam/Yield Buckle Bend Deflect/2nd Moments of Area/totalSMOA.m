function Itot = totalSMOA(I,Ay)
%
% yc = neutralAxis(Ay,ASum)
% Finds the neutral axis of object being bent/buckled
%
% Input arguments
% -----------------
%     I Array of individual second moments of area
%    Ay Matrix with [individualArea,
%                    centroid relative to arbitrary line;]
%
% Outputs
% -----------------
%     Itot combined second moment of area
%
A = Ay(:,1);
y = Ay(:,2);
yc = neutralAxis(Ay);
Itot = sum(I) + sum( (y-yc).^2 .* A);
fprintf('\n Total Second Moment of Area\n=============================\n')
fprintf(' I = sum( I_i ) + sum( shift^2 Ai )\n   =')
for i = 1:length(I)
    fprintf('+ %g',I(i))
end
fprintf('\n   ')
for i = 1:length(A)
    fprintf('+ (%g-%g)^2 * %g',y(i),yc,A(i))
end
fprintf('   = %g\n',Itot)