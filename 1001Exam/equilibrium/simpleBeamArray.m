function [lr,rr] = simpleBeamArray(L,mx)
%function [lr,rr] = simpleBeamArray(L,mx)
%
%takes the length of a simply supported beam,
%array of point loads on a beam and array of each mass' distance
%from the left support, and calculates the vertical reaction 
%forces at each end of the beam
%
%inputs:
% - L: length of the beam (m)
% - mx: array of point loads (kN) and their respective distances (m)
%       from the left end of the beam
%
%outputs:
% - lr: left support reaction
% - rr: right support reaction
%
%note: for a beam on an angle, take the length of the beam to be
%      the horizontal distance between the two ends, and the 
%      distance of the point load to be the perpendicular distance
%      from the left end

%taking moments at LR
rr = sum(mx(:,1).*mx(:,2))/L;
lr = sum(mx(:,1))-rr;

%printing equations
a=size(mx); 
mzStr="sum(mz) = ";

for i=1:a(1)
    mzStr = mzStr + sprintf("-%g*%g ",mx(i,1),mx(i,2));
end

mzStr=mzStr+sprintf("+ %g RR = 0",L);
fprintf('Equations\nTaking moments from left end,\n')
fprintf(mzStr)
fprintf('\nRR = %g\nsum(F_y) = LR - %g + %g = 0\nLR = %g',rr,sum(mx(:,1)),rr,lr)
fprintf('\n\nLeft Reaction: %g kN\nRight Reaction: %g kN\n',lr,rr)