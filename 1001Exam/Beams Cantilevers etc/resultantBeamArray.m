function [f,h] = resultantBeamArray(mx,my,mz)
% function [lr,rr] = resultantBeamArray(mx,my,mz)
%
% Takes the length of a simply supported beam,
% matrix of loads and distances from the left support on a beam
% to calculate the resultant force and location.
%
% Input arguments
% -----------------
%   mx vertical forces (column 1) and distances (column 2)
%   my horizontal forces (column 1) and distances (column 2)
%   mz moments occuring along beam
% Output arguments
% -----------------
%  f magnitude of resultant force
%  h distance of resultant force from left
%
fprintf('\n       resultantBeamArray()\n===============================\n')
if isempty(mx)
    mx = [0,0];
end
if ~exist("my","var")||isempty(my)
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
fprintf("O\n")
if ~isempty(mz)
    fprintf('        (Q is anticlockwise)\n\n')
end

%taking moments at LR
fy = sum(mx(:,1));
fprintf("Equations:\n")
h = (sum(mx(:,1).*mx(:,2)) + sum(my(:,1).*my(:,2)) + sum(mz))/fy;
%printing equations
fprintf('    sum(fy) =')
a=size(mx); 
mzStr="    sum(mz) = ";
for i=1:a(1)
    if mx(i) == 0
        continue
    end
    if i ~= 1
        fprintf(' +')
    end
    fprintf(' %g',mx(i))
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

mzStr=mzStr+sprintf("= -%g h",fy);
fprintf(' = %g\nTaking moments from left end,\n',fy)
fprintf(mzStr)
fprintf('\n          h = %g',h)
fprintf("\n\n    %gkN down %gm from the left\n",fy,h)
