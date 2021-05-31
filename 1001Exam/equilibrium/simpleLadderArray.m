function [f,w] = simpleLadderArray(x,y,mx)
% function [f,w] = simpleLadderArray(x,y,mx)
%
% Takes the distance between slippery wall and foot of ladder,
% height of ladder up the wall and
% matrix of loads and horizontal distances from the foot of the ladder
% to calculate the reactions at the floor and wall
%
% Input arguments
% -----------------
%   x  distance between wall and foot of ladder
%   y  height of ladder up the wall
%   mx matrix with column 1 loads, column 2 distance from foot of ladder
% Output arguments
% -----------------
%  f array of reactions at floor, x and y
%  w wall reaction
%

%                     //|| ^
%             0.8kN//   || |
%               //      || |
%       0.1kN//         || y
%         //            || |
%      //               || |
%    A                  || v
%    ====================
%    ---1m-->
%    -------1.5m-->
%    <--------x--------->

fprintf('\n    simpleLadderArray()\n===============================\n  Wall is slippery\n\n')
% create diagram
fprintf('Diagram:\n')
mx = sortrows(mx, 2);
lad = ["    A","      //","         //"];
arrows = [""];
for i = 1:length(mx(:,1))
    rung = mx(i,1)+"kN//";
    nRung = " //";
    arr = "    ";
    while strlength(rung) < 8+6*i
        rung = " " + rung;
    end
    for j = 1:strlength(rung)-10-length(num2str(mx(i,2)))
        nRung = " "+nRung;
        arr = arr + "-";
    end
    for j = 1:10+length(num2str(mx(i,2)))
        nRung = " "+nRung;
    end
    lad(length(lad)+1) = rung;
    lad(length(lad)+1) = nRung;
    arrows(length(arrows)+1) = arr+mx(i,2)+"m-->\n";
end
for i = 1:strlength(lad(end))
    fprintf(" ")
end
fprintf("||\n")
for i = 1:length(lad)
    rung = lad(i);
    while strlength(rung) < strlength(lad(end))
        rung = rung + " ";
    end
    rung = rung + "||  ";
    if i == 1
        rung = rung + "V";
    elseif i == length(lad)
        rung = rung + "^";
    elseif i == round(length(lad)/2)
        rung = rung + y + "m";
    else
        rung = rung + "|";
    end
    lad(i) = rung + "\n";
end
fprintf(strjoin(fliplr(lad),"")+"    ")
for i = 1:strlength(lad(end))-9
    fprintf("=")
end
fprintf("\n" + strjoin(fliplr(arrows),"") + "    ")
fprintf("<")
iMax = strlength(lad(end))-13-length(num2str(x));
for i = 1:iMax
    if i == round(iMax/2)
        fprintf("%gm",x)
        continue
    end
    fprintf("-")
end
fprintf(">\n")

% floor provides upwards force
fy = sum(mx(:,1));
fprintf('\nEquations:\n    sum(Fy) = fy ')
fprintf('-%g ',mx(:,1))
fprintf('= 0\n         fy = %g\n',fy)

% moments at foot
w = -sum(mx(:,1).*mx(:,2))/y;
fprintf('    Taking moments from the foot,\n    sum(Mz) = ')
fprintf('-%g*%g ',mx)
fprintf('-%g w\n          w = %g\n',y,w)

% horizontal forces
fx = -w;
fprintf('    sum(Fx) = fx  + w = 0\n         fx = %g',fx)

f = [fx,fy];
fprintf('\n\nReaction at foot: %gkN (horizontal)\n                  %gkN (vertical)\n Reaction at wall: %gkN\n',fx,fy,w)