function I = MOIcylinder(m,r,L)
%
% I = MOIcylinder(m,r,L)
% Takes mass, length and radius of solid cylinder spinning on its
% central diameter and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of cylinder
%    r radius of cylinder
%    L length of cylinder
% Outputs
% -----------------
%    I moment of inertia
%
I = m*r^2/4 + m*L^2/12;
fprintf(' I = m*r^2/4 + m*L^2/12\n   = %g',I)