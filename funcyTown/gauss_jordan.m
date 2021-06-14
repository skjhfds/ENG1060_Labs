function x = gauss_jordan(A,b)
% x = gauss_jordan(A,b)
% Written by: ???, ID: ???
% Last modified: ???
% uses Gauss-Jordan elimination to solve matrix equation
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
for c = 1:n-1
    % partial pivoting
    if Aug(c,c) == 0
        [maxval, index] = max(abs(Aug(c+1:n,c)));
        rowswap = c + index;
        Aug([c, rowswap],:) = Aug([rowswap,c],:);
    end
    
    for r = c+1:n
        factor = Aug(r,c)/Aug(c,c);
        Aug(r,c:n+1) = Aug(r,c:n+1) - factor*Aug(c,c:n+1);
    end
end

%% backward elimination
for c = n:-1:2
    for r = c-1:-1:1      
        factor = Aug(r,c)/Aug(c,c);
        Aug(r,c) = 0;
        Aug(r,n+1) = Aug(r,n+1) - factor*Aug(c,n+1);
    end
end

%% direct solution
x = Aug(:,n+1)./diag(Aug);