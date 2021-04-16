function Velocity_corrected_5Points = Velocity_Correction(velocity)
%
% Velocity_corrected_5Points = Velocity_Correction(velocity)
% Written by: Harry Choi, 32464223
% Created on 15-Apr-2021
% The Velocity_Correction function takes a noisy array of values
% and creates an array of 5-point moving averages
% Despite the prescribed variable names its uses are not limited
% to filtering noise in time history of velocities
% 
% Input arguments
% -----------------
%  velocity array of noisy values
%
% Output arguments
% -----------------
%  Velocity_corrected_5Points array of clean values
%
L = length(velocity);

% initialise output array
Velocity_corrected_5Points=zeros(1,L);

% set first 2 and last 2 values
Velocity_corrected_5Points(1:2) = mean(velocity(1:5));
Velocity_corrected_5Points(L-1:L) = mean(velocity(L-4:L));

% why would anyone use if statements here?
for i = 3:L-2
    Velocity_corrected_5Points(i)=mean(velocity(i-2:i+2));
end