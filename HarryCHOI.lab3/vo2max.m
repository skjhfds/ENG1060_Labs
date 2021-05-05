function vo2 = vo2max(t)
%
% vo2 = vo2max(t)
% Written by: Harry Choi, 32464223
% Created on 25-Mar-2021
% The vo2max function takes a hours trained weekly input
% and calculates the vo2 max
% 
% Input arguments
% -----------------
% t - time in hours
% 
% Output arguments
% -----------------
% vo2 - output in mL/kg/min
%

    vo2 = (0.1*sin(.07*t).*t.^1.8)+35;
end