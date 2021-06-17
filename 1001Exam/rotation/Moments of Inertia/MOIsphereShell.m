function I = MOIsphereShell(m,r)
%
% I = MOIsphereShell(m,r)
% Takes mass and radius of spherical shell and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of spherical shell
%    r radius of spherical shell
% Outputs
% -----------------
%    I moment of inertia
%
I = 2/3 * m*r^2;
fprintf(' I = 2/3 * m*r^2\n   = %g',I)