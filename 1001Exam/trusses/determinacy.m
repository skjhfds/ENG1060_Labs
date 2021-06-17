function determinacy(m,r,j)
%function = determinacy(m,r,j)
%
%takes the number of members, reactions, and joints and
%calculates if a truss is determinate 

fprintf('    determinacy()\n=======================\n')
fprintf('m+r')
if m+r==2*j
    fprintf('=2j\nDeterminate\n')
elseif m+r>2*j
    fprintf('>2j\nIndeterminate\n')
else
    fprintf('<2\nCheck for stability\n')
end