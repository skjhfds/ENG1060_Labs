function I = MOIrodEnd(m,L)
%
% I = MOIrodEnd(m,L)
% Takes mass and length of rod spinning at its
% end and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of rod
%    L length of rod
% Outputs
% -----------------
%    I moment of inertia
%
I = m*L^2 / 3;
fprintf(' I = m*L^2 / 3\n   = %g',I)