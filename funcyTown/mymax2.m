function [max_value, row, column] = mymax2(x)
%
% [max_value, index] = mymax2(x)
% Written by: Harry Choi, 32464223
% Created on 23 Apr-2021
% The mymax2 function takes a matrix of values
% and returns the maximum value and its indices
% As there can be multiple instances of the maximum value,
% an array was used for row and column
% 
% Input arguments
% -----------------
%  x array of values
%
% Output arguments
% -----------------
%  max_value maximum value
%        row an array of row index/indices of maximum value(s)
%     column an array of row index/indices of maximum value(s)
%
max_value = x(1);
row = [1];
column = [1];
s = size(x);
for i=1:s(1)
    for j=1:s(2)
        if x(i,j) > max_value
            max_value = x(i,j);
            row = [i];
            column = [j];
        elseif x(i,j) == max_value
            row(end+1) = [i];
            column(end+1) = [j];
        end
    end
end