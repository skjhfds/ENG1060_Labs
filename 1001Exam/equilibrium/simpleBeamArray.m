function [lr,rr] = simpleBeamArray(L,mx)
% function [lr,rr] = simpleBeamArray(L,mx)
%
% Takes the length of a simply supported beam,
% matrix of loads and distances from the left support on a beam
% to calculate the reactions at both ends.
%
% Input arguments
% -----------------
%   L  length of beam
%   mx matrix with column 1 loads, column 2 distance from left support
% Output arguments
% -----------------
%  lr left support reaction
%  rr right support reaction
%
fprintf('\n       simpleBeamArray()\n===============================\n')
mx = sortrows(mx, 2);
% Generate Diagram
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
for i = 1:strlength(d(1))-2
    fprintf("=")
end
fprintf("\n    A")
for i = 1:strlength(d(1))-4
    fprintf(" ")
end
fprintf("O\n    <")
iMax = strlength(d(1))-4-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf(L+"m")
        continue
    end
    fprintf("-")
end
fprintf(">\n\n")

%taking moments at LR
rr = sum(mx(:,1).*mx(:,2))/L;
lr = sum(mx(:,1))-rr;

%printing equations
a=size(mx); 
mzStr="    sum(mz) = ";

for i=1:a(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx(i,1),mx(i,2));
end

mzStr=mzStr+sprintf("+ %g RR = 0",L);
fprintf('Equations\nTaking moments from left end,\n')
fprintf(mzStr)
fprintf('\n         RR = %g\n   sum(F_y) = LR - %g + %g = 0\n         LR = %g',rr,sum(mx(:,1)),rr,lr)
fprintf('\n\n Left Reaction: %gkN\nRight Reaction: %gkN\n',lr,rr)
