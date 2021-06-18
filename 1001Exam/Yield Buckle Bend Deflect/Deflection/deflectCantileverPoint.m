function ymax = deflectCantileverPoint(P,L,E,I)
fprintf('\nDeflection of Cantilever under Point Load\n')
fprintf('\n    y_max = ( -P * L^3 )/( 3 * E * I)')
ymax = ( -P * L^3 )/( 3 * E * I);