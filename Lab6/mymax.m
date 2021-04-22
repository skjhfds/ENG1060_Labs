function [max_value, index] = mymax(x)
%
% [max_value, index] = mymax(x)
% Written by: Harry Choi, 32464223
% Created on 23 Apr-2021
% The Velocity_Correction function takes a noisy array of values
% and creates an array of n-point moving averages
% Despite the prescribed variable names its uses are not limited
% to filtering noise in time history of velocities
% 
% Input arguments
% -----------------
%  velocity array of noisy values
%         n odd integer determining extent of cleaning
%
% Output arguments
% -----------------
%  Velocity_corrected_nPoints array of clean values
%
max_value = x(1);
index = [1];
for i=2:length(x)
    if x(i) > max_value
        max_value = x(i);
        index=[i];
    elseif x(i)==max_value
        index(end+1)=i;
    end
end