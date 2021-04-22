function [x,y] = fun_polar(fhandle,N)
%
% [x,y] = fun_polar(fhandle,N)
% Written by: Harry Choi, 32464223
% Created on 23-Apr-2021
% The fun_polar function takes a polar function with the number of rotations
% and creates arrays for each corresponding x and y values
% Despite its name it is not fun
% 
% Input arguments
% -----------------
%  fhandle function handle of circular function
%        N number of revolutions
%
% Output arguments
% -----------------
%  x x-coordinates
%  y y-coordinates
%
domT = 0:0.01:2*pi*N;
x = fhandle(domT).*cos(domT);
y = fhandle(domT).*sin(domT);