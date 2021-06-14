function i = liquad(A,b)
% x = gauss(A,b)
% Written by: ???, ID: ???
% Last modified: ???
% uses Gaussian elimination to solve matrix equation
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
i=0;
%% forward elimination
for c = 1:n-1
    % partial pivoting
    if mod(round(Aug(c,c)),5) == 0
        i=i+1;
        [maxval, index] = max(abs(Aug(c+1:n,c)));
        rowswap = c + index;
        Aug([c, rowswap],:) = Aug([rowswap,c],:);
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
