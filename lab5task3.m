close all; clc; clear
fprintf('Quadratic Program - What are the quadratic coefficients?\n')
valid = 0;
while ~valid
    a = input('a:');
    if a==0
        clc;
        fprintf('Error! A must be non-zero value!\n');
        continue
    end
    b = input('b:');
    c = input('c:');
    valid = 1;
end
fprintf('For quadratic coefficients a=%0.2f, b=%0.2f and c=%0.2f\n',a,b,c)
[x1,x2,discriminant] = my_quadratic(a,b,c);
if discriminant < 0
    x2 = sprintf('%.3f - %.3fi',real(x1),imag(x1)); %conjugate pairs, looks nicer with space after '-'
    x1 = sprintf('%.3f + %.3fi',real(x1),imag(x1));    
    fprintf('A pair of non-equal complex valued roots exists and are x1=%s and x2=%s',x1,x2)
else
    x1 = string(round(x1,3));
    x2 = string(round(x2,3));
    if discriminant == 0
        fprintf('A pair of equal real valued root exists and are x=%s',x1)
    else
        fprintf('A pair of non-equal real valued roots exists and are x1=%s and x2=%s',x1,x2)
    end
end