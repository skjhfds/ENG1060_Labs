function a = rigidBodyAcceleration(I,T)
%
% Rotation of a rigid body using torque, moment of inertia
% and angular acceleration
%
% T is torque
% I is moment of inertia
% a is angular acceleration
%
a = T/I;
fprintf('\n a = T/I \n')