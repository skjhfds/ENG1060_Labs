function I = MOIrodCenter(m,L)
%
% I = MOIrodCenter(m,L)
% Takes mass and length of rod spinning at its
% center and gives moment of inertia
%
% Input arguments
% -----------------
%    m mass of rod
%    L length of rod
% Outputs
% -----------------
%    I moment of inertia
%
I = m*L^2 / 12;
fprintf(' I = m*L^2 / 12\n   = %g',I)