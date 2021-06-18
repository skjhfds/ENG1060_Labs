function ymax = deflectCantileverUDL(w,L,E,I)
fprintf('\nDeflection of Cantilever under Uniformly Distributed Load\n')
fprintf('\n    y_max = ( -w * L^4 )/( 8 * E * I)')
ymax = ( -w * L^4 )/( 8 * E * I);