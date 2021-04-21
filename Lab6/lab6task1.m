% do the bonus one later

clear;clc;close all
% test function and domain
f = @(x) x.^(1./x);
domX = 1:0.001:50;

% mymax()
[max_value, index] = mymax(f(domX));
fprintf('mymax() gives maximum value %f at index %.0f\n',max_value, index);
% MATLAB max()
[max_value2, index2] = max(f(domX));
fprintf('  max() gives maximum value %f at index %.0f\n',max_value2, index2);
if index == index2
    fprintf('Both functions gave the same output')
else
    fprintf('The functions gave different outputs')
end

plot(domX,f(domX))
hold on
plot(domX(index), max_value,'or')
title('f(x)')
xlabel('x')
ylabel('f(x)')
legend('f(x)',sprintf('Maximum at (%f, %.0f)',domX(index), max_value),'Location', 'best outside')
