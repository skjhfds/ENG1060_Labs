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
cL = cM/area;   % characteristic load
fprintf('  characteristicLoad()\n===============================')
fprintf('\n       Average Mass: %g\n Standard Deviation: %g\nCharacteristic Mass: %g\nCharacteristic Load: %g\n',m,sD,cM,cL)