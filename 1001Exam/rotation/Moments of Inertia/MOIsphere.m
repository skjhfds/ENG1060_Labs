function I = MOIsphere(m,r)
%
% I = MOIsphere(m,r)
% Takes mass and radius of sphere and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of sphere
%    r radius of sphere
% Outputs
% -----------------
%    I moment of inertia
%
I = 2/5 * m*r^2;
fprintf(' I = 2/5 * m*r^2\n   = %g',I)