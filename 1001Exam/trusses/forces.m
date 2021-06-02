function [xr,yr] = forces(x,y)
%function [fx,fy] = forces(x,y)
%
%takes arrays of forces and their angles to the horizontal axis
%and calculates the resultant forces to maintain equilibrium
%
%inputs:
% - x: array of forces (column 1) and respective angles in degrees to the
%      horizontal axis (column 2)
%      positive to the right
% - y: array of forces (column 1) and respective angles in degrees to the
%      horizontal axis (column 2)
%      positive upwards
%
%outputs:
% - xr: resultant force in the horizontal direction
% - yr: resultant force in the vertical direction

%resolving along the horizontal axis
xr = -sum(x(:,1).*cos(deg2rad(x(:,2))));

%resolving along the vertical axis
yr = -sum(y(:,1).*sin(deg2rad(y(:,2))));

%printing equations
fprintf('  forces()\n==============\n    Equations:\n')

xStr = "    sum(F_x) = ";
for i=1:length(x(:,1))-1
    xStr = xStr + sprintf("%g * cos(%g) + ",x(i,1),x(i,2));
end
xStr = xStr + sprintf("%g * cos(%g) + XR = 0\n",x(end,1),x(end,2));

fprintf(xStr)
fprintf('    XR = %g N\n',xr)

yStr = "    sum(F_y) = ";
for i=1:length(y(:,1))-1
    yStr = yStr + sprintf("%g * sin(%g) + ",y(i,1),y(i,2));
end
yStr = yStr + sprintf("%g * sin(%g) + YR = 0\n",y(end,1),y(end,2));

fprintf(yStr)
fprintf('    YR = %g N\n',yr)

f=true;
if abs(xr)>0.01
    fprintf('    A horizontal resultant force of %.4f N is required.\n',xr)
    f=false;
end
if abs(yr)>0.01
    fprintf('    A vertical resultant force of %.4f N is required.\n',yr)
    f=false;
end
if f
    fprintf('    The system is already in equilibrium.\n')
end