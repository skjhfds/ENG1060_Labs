function I = MOIhoop(m,r)
%
% I = MOIhoop(m,r)
% Takes mass and radius of hoop and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of hoop
%    r radius of hoop
% Outputs
% -----------------
%    I moment of inertia
%
I = m*r^2;
fprintf(' I = m*r^2 \n   = %g',I)