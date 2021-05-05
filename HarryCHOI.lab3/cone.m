function [A,h] = cone(r,V)
%
% [A,h] = cone(r,V)
% Written by: Harry Choi, 32464223
% Created on 26-Mar-2021
% The cone function takes radius and volume of a cone as inputs
% and calculates surface area and height
% 
% Input arguments
% -----------------
% r - radius in meters
% V - volume in cubic meters
%
% Output arguments
% -----------------
% A - surface area in square meters
% h - height in meters
%

    h = 3*V./(pi*r.^2);
    A = pi*r.*sqrt(r.^2+h.^2);
end