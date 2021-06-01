function [r,m] = cantileverArray(L,mx)
%function r = cantilever(L,mx)
%
%takes the length of a cantilever, vertical point loads on beam,
%and distances from support to calculate the vertical reaction 
%force and the moment at the support
%
%inputs:
% - L: length of the beam
% - mx: matrix with column 1 loads, column 2 distance from support
%
%outputs:
% - r: vertical support reaction
% - m: moment

%taking moments at the support
m=sum(mx(:,1).*mx(:,2));
r=sum(mx(:,1));

fprintf('cantilever()======================\n\n')


%printing diagram
mx = sortrows(mx, 2);
a = size(mx);
d = [""];
fprintf("Diagram:\n")
for i = 1:a(1)
    row = "    --";
    if i > 1
        for j = 1:strlength(d(1))-length(num2str(mx(i,2)))-10
            row = row + "-";
        end
    end
    row = row + mx(i,2) + "m-->";
    if i ~= 1
        row = row + "\n";
    end
    d(i) = row;
    d(1) = d(1) + mx(i,1) + "kN    ";
end
fprintf(strjoin(fliplr(d),"")+"\n    ")
fprintf("|")
for i = 1:strlength(d(1))-3
    fprintf("=")
end
fprintf("\n    A")
for i = 1:strlength(d(1))-4
    fprintf(" ")
end
fprintf(" \n    <")
iMax = strlength(d(1))-4-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf(L+"m")
        continue
    end
    fprintf("-")
end
fprintf(">\n\n")


%printing equations
a=size(mx)
mzStr="    sum(mz) = M ";

for i=1:a(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx(i,1),mx(i,2));
end
mzStr = mzStr+"= 0\n";

rStr = "";
for i=1:a(1)
    rStr = rStr + sprintf("-%g ",mx(i,1));
end
rStr = rStr + "= 0\n";

fprintf('Equations:\n    Taking moments at the support,\n')
fprintf(mzStr)
fprintf('    M = %g kN\n    sum(F_y) = R ',m)
fprintf(rStr)
fprintf('    R = %g kN\n',r)