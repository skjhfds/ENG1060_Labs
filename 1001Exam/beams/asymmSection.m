function [yc,I] = asymmSection(area)
%function [yc,I] = asymmSection(area)
%
%takes information about an asymmetrical (comprised of rectangles) beam
%and calculates the neutral axis and the second moment of area
%
%inputs:
% - area: array with width (parallel to axis) (column 1), height 
%(column 2), and distance (column 3) of each rectangular section
%
%outputs:
% - yc: neutral axis from given arbitrary point
% - I: second moment of area about neutral axis

%calculating neutral axis
A = area(:,1).*area(:,2);
y = area(:,3);
yc = sum(A.*y)/sum(A);

%calculating shift
a=size(area);
length=a(1);
s = yc*ones(length,1)-y;

%calculating second moment of area
for i=1:length
    comp1(i) = area(i,1)*(area(i,2)^3)/12;
end
comp1=sum(comp1);

for i=1:length
    comp2(i) = area(i,1)*area(i,2)*(s(i)^2);
end
comp2=sum(comp2);

I = comp1+comp2;


%printing equations
fprintf('         asymmSection()\n================================\n\n')
fprintf('Equations:\n    Area     y\n')
fprintf('    %-5g    %-5g\n',[A y]')

ycStr = sprintf("\n    yc = (%g*%g",A(1),y(1));
for i=2:length
    ycStr = ycStr+sprintf(" + %g*%g",A(i),y(i));
end
ycStr = ycStr + ")";

ycStr2 = sprintf("/(%g",A(1));
for i=2:length
    ycStr2 = ycStr2 + sprintf(" + %g",A(i));
end
ycStr2 = ycStr2 + sprintf(") = %g\n",yc);

fprintf(ycStr+ycStr2)

iStr = "    I  = ";
for i=1:length
    iStr = iStr + sprintf("(%g*%g)/12 + ",area(i,1),area(i,2));
end

for i=1:length-1
    iStr = iStr + sprintf("%g*%g*(%g)^2 + ",area(i,1),area(i,2),s(i));
end
iStr = iStr + sprintf("%g*%g*(%g)^2\n",area(end,1),area(end,2),s(end));
    
fprintf(iStr)
fprintf('    I  = %g\n',I)