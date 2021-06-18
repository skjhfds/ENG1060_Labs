function ymax = deflectBeamUDL(w,L,E,I)
fprintf('\nDeflection of Beam under Uniformly Distributed Load\n')
fprintf('\n    y_max = ( -5 * w * L^4 )/( 384 * E * I)')
ymax = ( -5 * w * L^4 )/( 384 * E * I);