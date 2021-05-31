function [lr,rr] = simpleBeamArray(L,mx)
%function [lr,rr] = simpleBeamArray(L,mx)
%
%takes the length of a simply supported beam,
%array of masses on a beam and array of each mass' distance
%from the left support
%

%taking moments at LR
rr = sum(mx(1).*mx(2))/L;
lr = sum(mx(1))-rr;

fprintf(