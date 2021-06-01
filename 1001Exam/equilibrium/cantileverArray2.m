function [h,v,m] = cantileverArray2(L,mx1,mx2,mx3)
%function [h,v,m] = cantileverArray2(L,mx1,mx2,mx3)
%
%takes the length of a cantilever, horizontal and vertical forces 
%and their respective distances from the support, as well as
%moments along the beam, and calculates the internal moment, vertical,
%and horizontal reaction forces
%
%inputs:
% - L: length of the beam
% - mx1: horizontal forces (column 1) and distances (column 2)
% - mx2: vertical forces (column 1) and distances (column 2)
% - mx3: moments occuring along beam
%
%outputs:
% - h: horizontal reaction
% - v: vertical reaction
% - m: reaction moment

%start by taking moments at support
m=sum(mx1(:,1).*mx1(:,2))+sum(mx2(:,1).*mx2(:,2))-sum(mx3);
v=sum(mx2(:,1));
h=sum(mx1(:,1));

%printing equations
mzStr = "    sum(mz) = M ";

a=size(mx1); 
for i=1:a(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx1(i,1),mx1(i,2));
end

b=size(mx2);
for i=1:b(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx2(i,1),mx2(i,2));
end

c=size(mx3);
for i=1:c(1)
    mzStr = mzStr + sprintf("+ %g",mx3(i));
end
mzStr = mzStr + " = 0\n";

fprintf('  cantileverArray2\n=============================\n\n')
fprintf('Equations:\n    Taking moments at the support,\n')
fprintf(mzStr)
fprintf('    M = %g kNm\n',m)

vStr = "    sum(F_y) = V";
for i=1:b(1)
    vStr = vStr + sprintf(" - %g",mx2(i,1));
end
vStr = vStr + " = 0\n";

fprintf(vStr)
fprintf('    V = %g kN\n',v)

hStr = "    sum(F_x) = H";
for i=1:a(1)
    hStr = hStr + sprintf(" - %g",mx1(i,1));
end
hStr = hStr + " = 0\n";

fprintf(hStr)
fprintf('    H = %g kN\n',h)
