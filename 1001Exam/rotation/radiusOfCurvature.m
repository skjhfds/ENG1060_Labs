function rho = radiusOfCurvature(dydx,d2ydx2,x)
%
% rho = radiusOfCurvature(dydx,d2ydx2,x)
% Takes first and second derivative of the function of
% an object's path then outputs instantaneous radius of
% curvature
%
% Input arguments
% -----------------
%    dydx first derivative of path function
%  d2ydx2 second derivative of path function
%       x point to calculate instantaneous radius of curvature at
% Outputs
% -----------------
%     rho instantaneous radius of curvature
%
fprintf('    radiusOfCurvature()\n=========================\n\n')
fprintf('Equations:\n')
fprintf('      dydx = %s\n', func2str(dydx))
fprintf('    d2ydx2 = %s\n', func2str(d2ydx2))
fprintf('    (1 + (dydx)^2)^(3/2)  /  abs(d2ydx2)\n')
fprintf('     = (1 + %g^2)^(3/2)  /  abs(%g)\n',dydx(x),d2ydx2(x))
rho = (1 + (dydx(x))^2)^(3/2)  /  (abs(d2ydx2(x)));
fprintf('     = %gm\n',rho)