function [max_value, index] = mymax(x)
%
% [max_value, index] = mymax(x)
% Written by: Harry Choi, 32464223
% Created on 23 Apr-2021
% The mymax function takes an array of values
% and returns the maximum value and its index/indices
% As there can be multiple instances of the maximum value,
% an array was used
% 
% Input arguments
% -----------------
%  x array of values
%
% Output arguments
% -----------------
%  max_value maximum value
%      index an array of index/indices of maximum value(s)
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