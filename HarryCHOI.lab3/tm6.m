function ex = tm6(x)
%
% ex = tm6(x)
% Written by: Harry Choi, 32464223
% Created on 26-Mar-2021
% The tm6 function takes x as input
% and calculates e^x using the first 6 terms of a Taylor/Maclaurin series
% 
% Input arguments
% -----------------
% x - exponent of e
%
% Output arguments
% -----------------
% e - e^x approximation
%

    n=0:5;
    ex = sum(x'.^n./factorial(n),2)';
end