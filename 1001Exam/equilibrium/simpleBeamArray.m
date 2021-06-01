function [lr,rr] = simpleBeamArray(L,mx,my,mz)
% function [lr,rr] = simpleBeamArray(L,mx,my,mz)
%
% Takes the length of a simply supported beam,
% matrix of loads and distances from the left support on a beam
% to calculate the reactions at both ends.
%
% Input arguments
% -----------------
%   L  length of beam
%   mx vertical forces (column 1) and distances (column 2)
%   my horizontal forces (column 1) and distances (column 2)
%   mz moments occuring along beam
% Output arguments
% -----------------
%  lr left support reactions
%  rr right support reaction
%
fprintf('\n       simpleBeamArray()\n===============================\n')
if isempty(mx)
    mx = [0,0];
end
if ~exist("my","var")
    my = [0,0];
end
if ~exist("mz","var")
    mz = [];
end
% Generate Diagram
a = size(mx);
d0 = [""]; d1 = [""];
fprintf("Diagram:\n      ")
% vertical load
for i = 1:a(1)
    if mx(i) == 0
        continue
    end
    d1(i) = "V " + mx(i)+"kN  ";
end
% vertical distance
for i = 1:a(1)
    if mx(i) == 0
        continue
    end
    d0(i) = "| " + mx(i,2)+"m";
end

% horizontal load
a = size(my);
aa = length(d1);
for i = 1:a(1)
    if my(i) == 0
        continue
    end
    d1(i+aa) = "--> " + my(i)+"kN  ";
end
% horizontal distance
for i = 1:a(1)
    if my(i) == 0
        continue
    end
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
    d = d + " Q " + mz(i)+"kN ";
end
fprintf(strjoin(d0) + "\n      ")
fprintf(d+"\n    ")
for i = 1:strlength(d)+2
    fprintf("=")
end
fprintf("\n    A")
for i = 1:strlength(d)
    fprintf(" ")
end
fprintf("O\n    <")
iMax = strlength(d(1))-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf(L+"m")
        continue
    end
    fprintf("-")
end
fprintf(">\n\n")

%taking moments at LR
rr = (sum(mx(:,1).*mx(:,2)) + sum(my(:,1).*my(:,2)) + sum(mz))/L;
lry = sum(mx(:,1))-rr;
lrx = -sum(my(:,1));
lr = [lrx, lry];

%printing equations
a=size(mx); 
mzStr="    sum(mz) = ";
for i=1:a(1)
    if mx(i) == 0
        continue
    end
    mzStr = mzStr + sprintf("-%g*%g ",mx(i,1),mx(i,2));
end
a=size(my);
for i=1:a(1)
    if my(i) == 0
        continue
    end
    mzStr = mzStr + sprintf("-%g*%g ",my(i,1),my(i,2));
end
a=size(mz);
for i=1:a(1)
    mzStr = mzStr + sprintf("-%g ",mz(i));
end

mzStr=mzStr+sprintf("+ %g RR = 0",L);
fprintf('Equations\nTaking moments from left end,\n')
fprintf(mzStr)
fprintf('\n         RR = %g\n   sum(F_y) = LRy - %g + %g = 0\n        LRy = %g\n   sum(F_x) = LRx + %g = 0\n        LRx = %g',rr,sum(mx(:,1)),rr,lry,sum(my(:,1)), lrx)
fprintf('\n\n Left Reaction: ')
if lrx == 0
    fprintf('%gkN\n',lry)
else
    fprintf('%gkN (horizontal)\n                %gkN (vertical)\n',lr)
end
fprintf('Right Reaction: %gkN\n',rr)
