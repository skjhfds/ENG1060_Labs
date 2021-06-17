function cL = characteristicLoad(a, area)
%
% cL = characteristicLoad(a)
% Takes an array of masses and surface area
% then outputs characteristic load
%
% Input arguments
% -----------------
%     a array of masses
%  area surface area
% Output arguments
% -----------------
%   cL load with 5% chance of being exceeded
%
m = mean(a);    % average mass
sD = std(a);    % standard deviation of mass
cM = m+1.65*sD; % characteristic mass
cL = cM*length(a)/100/area;   % characteristic load
fprintf('\n  characteristicLoad()\n===============================')
fprintf('\n       Average Mass: %gkg\n Standard Deviation: %gkg\nCharacteristic Mass: %gkg\nCharacteristic Load: %gkPa\n',m,sD,cM,cL)