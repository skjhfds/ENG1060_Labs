function rLoads = trapLoad(L,min,max,offset)
% rLoads = trapLoad(L,max,offset)
%
% Takes the length, minimum load, maximum load and offset of a
% trapezoidal load and returns the equivalent point load.
%
% Input arguments
% -----------------
%   L      length of beam force applies
%   min    minimum UDL
%   max    maximum UDL
%   offset left most point of triangle from left of beam
% Output arguments
% -----------------
%  rLoads matrix of two resultant loads with [magnitude, distance from left;magnitude, distance from left]
%
fprintf('\n       trapLoad()\n===============================\nDiagram:\n')
s = ""; %spacer
if exist('offset','var')
    for i = 1:length(num2str(offset))+4
        s = s+" ";
    end
else
    s = "    ";
    offset = 0;
end
while strlength(s) < length(num2str(min))+5
    s = s+" ";
end
t = [sprintf("        %gkN/m\n",max),"             /|\n","           /| |\n","         /| | |\n","       /| | | |\n","    | | | | | |\n","    V V V V V V\n"];
for i = 1:length(t)
    if i == 6
        for j = 1:strlength(s)-length(num2str(min))
            fprintf(" ")
        end
        fprintf("%gkN/m /| | | | |\n",min)
    end
    fprintf(s+t(i))
end
fprintf("    ")
for i = 1:strlength(s)+15
    fprintf("=")
end
if offset ~= 0
    fprintf("\n    -")
    for i = 1:strlength(s)-(length(num2str(offset))+4)
        fprintf("-")
    end
    fprintf("%gm-><",offset)
else
    fprintf("\n    "+s+"<")
end
iMax = 8-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf("%gm",L)
    end
    fprintf("-")
end
fprintf(">\n")
tl = L*(max-min)/2; % triangle component
rl  = min*L; % rectangle component
fprintf("Equations:\n   Triangular component\n      F = %g * (%g - %g) / 2\n        = %g\n      x = %g *2/3",L,max,min,tl,L)
if offset ~= 0
    fprintf(" + %g",offset)
end
tlx = L*2/3+offset;
fprintf("\n        = %g\n",tlx)
fprintf("  Rectangular component\n      F = %g * %g = %g\n      x = %g /2",min,L,rl,L)
if offset ~= 0
    fprintf(" + %g",offset)
end
rlx = L/2+offset;
fprintf(" = %g\n",rlx)
rLoads = [tl,tlx;
    rl,rlx];
fprintf('Resultant Loads:\n    %gkN %gm from left',rLoads(1,:))
fprintf('\n    %gkN %gm from left\n',rLoads(2,:))