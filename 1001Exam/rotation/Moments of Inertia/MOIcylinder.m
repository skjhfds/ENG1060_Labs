function I = MOIcylinder(m,r)
%
% I = MOIcylinder(m,r)
% Takes mass and radius of solid cylinder
% and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of cylinder
%    r radius of cylinder
% Outputs
% -----------------
%    I moment of inertia
%
I = .5*m*r^2;
fprintf(' I = .5 * m * r^2\n   = .5 * %g * %g^2\n   = %g',m,r,I)