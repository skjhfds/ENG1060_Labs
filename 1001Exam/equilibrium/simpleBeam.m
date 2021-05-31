function [lr,rr]=simpleBeam(L,l,x)
%
% [lr,rr]=simpleBeam(L,l,x)
% Takes the length of a simply supported beam,
% point load on beam and distance from left support
% to calculate the reactions in each support.
%
% Input arguments
% -----------------
%   L length of beam
%   l load on beam (kN)
%   x distance from left support
% Output arguments
% -----------------
%  lr left support reaction
%  rr right support reaction
% 
% ----x---->0
%          /|\  l
%          / \
% =======================
% A                     O
% <---------L----------->
%

% taking moments from left support
rr = l*x/L;
lr = l-rr;
fprintf('\n     simpleBeam()\n===============================')
% print diagram
fprintf('\nDiagram:\n    ---%3g--->0\n             /|\\  %g(load)\n             / \\\n    =======================\n    A                     O\n    <--------%6g------->\n\n',x,l,L)
fprintf('Equations:\n    moments from left end,\n    sum(M_z) = -%g*%g + %grr\n          rr = %g*%g/%g = %g\n    sum(F_y) = lr + %g -%g\n          lr = %g-%g = %g\n\n',l,x,L,l,x,L,rr,rr,l,l,rr,lr)

fprintf(' Left Reaction: %g kN\nRight Reaction: %g kN\n',lr,rr)