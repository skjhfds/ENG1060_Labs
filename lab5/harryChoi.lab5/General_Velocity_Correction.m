function Velocity_corrected_nPoints = General_Velocity_Correction(velocity, n)
%
% Velocity_corrected_nPoints = General_Velocity_Correction(velocity, n)
% Written by: Harry Choi, 32464223
% Created on 15-Apr-2021
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

% check if n is odd
if mod(n, 2) == 0
    fprintf('Error! n must be odd!\n')
    return
end

L = length(velocity);

% initialise output array
Velocity_corrected_nPoints=zeros(1,L);

% set values for which n point moving averages cannot be found
Velocity_corrected_nPoints(1:(n-1)/2) = mean(velocity(1:n));
Velocity_corrected_nPoints(L+1-(n-1)/2:L) = mean(velocity(L+1-n:L));

for i = 1+(n-1)/2:L-(n-1)/2
    Velocity_corrected_nPoints(i)=mean(velocity(i-(n-1)/2:i+(n-1)/2));
end