function sa = RHS(w,h,t)
%
% sa = RHS(w,h,t)
% Takes width, hieght and thickness to give
% cross-sectional area of rectangular hollow section
%
% Input arguments
% -----------------
%   w width
%   h height
%   t thickness
% Output arguments
% -----------------
%  sa surface area of rectangular hollow section
%
sa = w*h - (w-2*t)*(h-2*t);
fprintf('\n            RHS()\n===============================')
fprintf('\nRHS %gx%gx%g',w,h,t)
fprintf('\nCross sectional Area: %g\n',sa)