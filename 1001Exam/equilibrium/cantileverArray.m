function [h,v,m] = cantileverArray(L,mx,my,mz)
%function [h,v,m] = cantileverArray(L,mx,my,mz)
%
%takes the length of a cantilever, horizontal and vertical forces 
%and their respective distances from the support, as well as
%moments along the beam, and calculates the internal moment, vertical,
%and horizontal reaction forces
%
%inputs:
% - L: length of the beam
% - mx: horizontal forces (column 1) and distances (column 2)
% - my: vertical forces (column 1) and distances (column 2)
% - mz: moments occuring along beam
%
%outputs:
% - h: horizontal reaction
% - v: vertical reaction
% - m: reaction moment

fprintf("  cantileverArray\n=============================\n")
if ~exist("my","var")
    my = [];
end
if ~exist("mz","var")
    mz = [];
end
% Generate Diagram
a = size(mx);
d0 = [""]; d1 = [""];
fprintf("Diagram:\n    ||  ")
% vertical load
for i = 1:a(1)
    d1(i) = "V " + mx(i)+"kN ";
end
% vertical distance
for i = 1:a(1)
    d0(i) = "| " + mx(i,2)+"m";
end

% horizontal load
a = size(my);
aa = length(d1);
for i = 1:a(1)
    d1(i+aa) = "--> " + my(i)+"kN ";
end
% horizontal distance
for i = 1:a(1)
    d0(i+aa) = "    " + my(i,2)+"m";
end

% match distances, d0 and d1
for i = 1:length(d0)
    while strlength(d0(i)) > strlength(d1(i))
        d1(i) = d1(i) + " ";
    end
    while strlength(d0(i)) < strlength(d1(i))
        d0(i) = d0(i) + " ";
    end
end

d = strjoin(d1);
% moments
a = size(mz);
for i = 1:a(1)
    d = d + " Q " + mz(i)+"kN    ";
end
fprintf(strjoin(d0) + "\n    ||  ")
fprintf(d+"\n    ||")
for i = 1:strlength(d)+2
    fprintf("=")
end
fprintf("\n    ||")
fprintf("<")
iMax = strlength(d(1))-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf(L+"m")
        continue
    end
    fprintf("-")
end
fprintf(">\n\n")

%start by taking moments at support
m=sum(mx(:,1).*mx(:,2))+sum(my(:,1).*my(:,2))-sum(mz);
v=sum(my(:,1));
h=sum(mx(:,1));

%printing equations
mzStr = "     sum(mz) = M ";

a=size(mx); 
for i=1:a(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx(i,1),mx(i,2));
end

b=size(my);
for i=1:b(1)
    mzStr = mzStr + sprintf("-%g*%g ",my(i,1),my(i,2));
end

c=size(mz);
for i=1:c(1)
    mzStr = mzStr + sprintf("+ %g",mz(i));
end
mzStr = mzStr + " = 0\n";

fprintf("Equations:\n    Taking moments at the support,\n")
fprintf(mzStr)
fprintf("           M = %g kNm\n",m)

vStr = "    sum(F_y) = V";
for i=1:b(1)
    vStr = vStr + sprintf(" - %g",my(i,1));
end
vStr = vStr + " = 0\n";

fprintf(vStr)
fprintf("           V = %g kN\n",v)

hStr = "    sum(F_x) = H";
for i=1:a(1)
    hStr = hStr + sprintf(" - %g",mx(i,1));
end
hStr = hStr + " = 0\n";

fprintf(hStr)
fprintf("           H = %g kN\n",h)

fprintf("\nHorizontal Reaction: %gkN\n  Vertical Reaction: %gkN\n    Reaction Moment: %gkN",h,v,m)
