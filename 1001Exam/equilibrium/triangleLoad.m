function lh = triangleLoad(L,max,offset)
% lh = triangleLoad(L,max,offset)
%
% Takes the length, maximum load and offset of a
% triangular load and returns the equivalent point load.
%
% Input arguments
% -----------------
%   L      length of beam force applies
%   max    maximum UDL
%   offset left most point of triangle from left of beam
% Output arguments
% -----------------
%  lh array with [magnitude, distance from left]
%
fprintf('       triangleLoad()\n===============================\nDiagram:\n')
s = ""; %spacer
if exist('offset','var')
    for i = 1:length(num2str(offset))+4
        s = s+" ";
    end
else
    s = "    ";
    offset = 0;
end
t = [sprintf("             %gkN/m\n",max),"            /|\n","          /| |\n","        /| | |\n","      /| | | |\n","    /V V V V V\n"];
for i = 1:length(t)
    fprintf(s+t(i))
end
fprintf("    ")
for i = 1:strlength(s)+14
    fprintf("=")
end
if offset ~= 0
    fprintf("\n    -%gm-><",offset)
else
    fprintf("\n    "+s+"<")
end
iMax = 7-length(num2str(L));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf("%gm",L)
    end
    fprintf("-")
end
fprintf(">\n")
lh = [L*max/2,offset + L*2/3];
fprintf('Equations:\n    Fy = %g * max /2\n     x = %g * 2/3',L,max,L)
fprintf('\n  %gkN %gm from left',lh)