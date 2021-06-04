function [x,i] = gauss(A,b)
% x = gauss(A,b)
% solution gauss file (clayton - workshop 12)
% 
% uses Gaussian elimination to solve matrix equation
%
% EDITED FOR CONSOLIDATION QUIZ
%
% INPUTS:
%  - A = square matrix of coefficients
%  - b = column vector of solutions
% OUTPUTS:
%  - x = column vector of unknowns

% Input Validation
[m,n] = size(A);
if m~=n
    error('Matrix A must be square')
end

%preallocating x
x = zeros(n,1);

%Augmented matrix
Aug = [A b];

%% forward elimination
i=0;
for c = 1:n-1
    % partial pivoting
    if Aug(c,c) == 0
        [maxval, index] = max(abs(Aug(c+1:n,c)));
        rowswap = c + index;
        Aug([c, rowswap],:) = Aug([rowswap,c],:);
        i=i+1; %counting the number of times partial pivoting occurs
    end
    
    for r = c+1:n
        factor = Aug(r,c)/Aug(c,c);
        Aug(r,c:n+1) = Aug(r,c:n+1) - factor*Aug(c,c:n+1);
    end
end

%% back substitution
x(n) = Aug(n,n+1)/Aug(n,n);
for r = n-1:-1:1
    x(r) = (Aug(r,n+1) - Aug(r,r+1:n)*x(r+1:n))/Aug(r,r);
end
