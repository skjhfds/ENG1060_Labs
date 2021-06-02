function [] = determinacy(m,r,j)
%function = determinacy(m,r,j)
%
%takes the number of members, reactions, and joints and
%calculates if a truss is determinate 

fprintf('    determinacy()\n=======================')

if m+r==2*j
    fprintf('\nDeterminate\n')
elseif m+r>2*j
    fprintf('\nIndeterminate\n')
else
    fprintf('\nCheck for stability\n')
end