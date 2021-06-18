function T = rigidBodyTorque(I,a)
%
% Rotation of a rigid body using torque, moment of inertia
% and angular acceleration
%
% T is torque
% I is moment of inertia
% a is angular acceleration
%
T = I*a;
fprintf('\nT = I*a\n')