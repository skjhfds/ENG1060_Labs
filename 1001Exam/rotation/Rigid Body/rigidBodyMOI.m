function I = rigidBodyMOI(T,a)
%
% Rotation of a rigid body using torque, moment of inertia
% and angular acceleration
%
% T is torque
% I is moment of inertia
% a is angular acceleration
%
I = T/a;
fprintf('\n I = T/a \n')