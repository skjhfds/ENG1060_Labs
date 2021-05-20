function [root,iter] = modisecant(f,xi,pert,precision)

%[root,iter] = modisecant(f,xi,pert,precision)
%
%Created by Hannah Tay 32521987
%Date created: 28th April 2021
%
%finds the root of a given function by taking an initial point
%xi and a small increment, and approximating the derivative as 
%the slope of the line between the two points
%
%inputs: 
%f - function handle
%xi - initial guess
%pert - increment
%precision - accepted value of f
%
%outputs: 
%root - root
%iter - iterations required to find the root within the specified precision

%function commands:
iter=0;
fxi=f(xi);
mi=(f(xi+pert)-f(xi))/pert;

while (abs(fxi))>precision
    xi_new=xi-fxi/mi;
    xi=xi_new;
    fxi=f(xi);
    mi=(f(xi+pert)-f(xi))/pert;
    iter=iter+1;
end
root=xi_new;
end
