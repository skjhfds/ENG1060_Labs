function [x,steps] = count_diagonalise(A,b)
% based on x = gauss(A,b)
% uses Gaussian elimination to solve matrix equation, counting steps along the way
%
% INPUTS:
%  - A = square matrix of coefficients
%  - b = column vector of solutions
% OUTPUTS:
%  - x = column vector of unknowns
%  - steps = how many steps in took to find x

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
% Start counting numerical execution steps from here:
steps = 0;
for c = 1:n-1
    % partial pivoting
    if Aug(c,c) == 0
        [maxval, index] = max(abs(Aug(c+1:n,c)));
        steps = steps + 2;
        rowswap = c + index;
        steps = steps + 2;
        Aug([c, rowswap],:) = Aug([rowswap,c],:);
        steps = steps + 1;
    end
    
    for r = c+1:n
        factor = Aug(r,c)/Aug(c,c);
        steps = steps + 2;
        Aug(r,c:n+1) = Aug(r,c:n+1) - factor*Aug(c,c:n+1);
        steps = steps + 6;
    end
end

%% back substitution
x(n) = Aug(n,n+1)/Aug(n,n);
steps = steps + 3;
for r = n-1:-1:1
    x(r) = (Aug(r,n+1) - Aug(r,r+1:n)*x(r+1:n))/Aug(r,r);
    steps = steps + 7;
end