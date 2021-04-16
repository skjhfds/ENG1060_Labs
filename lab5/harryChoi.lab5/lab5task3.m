% Harry Choi 32464223
% 15-Apr-2021
% Lab 5 Task 3
close all; clc; clear

% prompt for inputs
while true
    fprintf('Quadratic Program - What are the quadratic coefficients?\n')
    a = input('a:');
    % checks a is non-zero
    if a==0
        clc;
        fprintf('Error! A must be non-zero value!\n');
        continue
    end
    break
end
b = input('b:');
c = input('c:');

% print coefficients
fprintf('For quadratic coefficients a=%0.2f, b=%0.2f and c=%0.2f\nA pair of ',a,b,c)

% print roots
[x1,x2,discriminant] = my_quadratic(a,b,c);
% if imaginary, separate into real and imaginary terms
if discriminant < 0
    % roots are conjugate pairs and looks nicer with space after '-'
    x2 = sprintf('%.3f - %.3fi',real(x1),imag(x1));
    x1 = sprintf('%.3f + %.3fi',real(x1),imag(x1));
    fprintf('non-equal complex valued roots exists and are x1=%s and x2=%s',x1,x2)
else
    x1 = string(round(x1,3));
    x2 = string(round(x2,3));
    % check if roots are equal
    if discriminant == 0
        fprintf('equal real valued root exists and are x=%s',x1)
    else
        fprintf('non-equal real valued roots exists and are x1=%s and x2=%s',x1,x2)
    end
end