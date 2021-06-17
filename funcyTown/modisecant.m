function [root, iter] = modisecant(f, xi, pert, precision)
% [root, iter] = modisecant(f, xi, pert, precision)
% Written by: ???, ID: ???
% Last modified: ???
%
% General purpose algorithm for Modified Secant Method
%
% INPUTS:
%  - f: function handle of the equation to be solved
%  - xi: the initial guess
%  - pert: a small perturbation fraction
%  - precision: stopping criteria determined by the user
% OUTPUT:
%  - root: the root of the equation
%  - iter: total iteration taken

% Estimate 1st iteration of xi1 and initialise iteration count
iter=1;
xi1=xi-f(xi)*pert/(f(xi+pert)-f(xi));

% Iteration for modified secant method starts
while abs(f(xi1))>precision
    
    % Increment the iteration count by 1
    iter=iter+1;
    
    % updating variables
   
    xi=xi1;
    
    % recalculating xi1
    xi1=xi-f(xi)*pert/(f(xi+pert)-f(xi));

end
% The final xi1 value is the root
root = xi1;
