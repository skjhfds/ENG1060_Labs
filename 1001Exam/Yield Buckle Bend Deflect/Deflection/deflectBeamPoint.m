function ymax = deflectBeamPoint(P,L,E,I)
fprintf('\nDeflection of Beam under Point Load\n')
fprintf('\n    y_max = ( -P * L^3 )/( 48 * E * I)')
ymax = ( -P * L^3 )/( 48 * E * I);