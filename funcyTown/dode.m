function [SA,V] = dode(a)
s = size(a);
a2 = zeros(s);
a3 = a2;
for i = 1:s(1)
    for j = 1:s(2)
        a2(i,j) = a(i,j)^2;
        a3(i,j) = a(i,j)^3;
    end
end
        
SA = 3*a2*sqrt(25+10*sqrt(5));
V = (15+7*sqrt(5))/4*a3;