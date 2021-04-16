% Harry Choi 32464223
% 15-Apr-2021
% Lab 5 Task 2
close all; clc; clear

% Define Coefficient of Static Friction Table
materials = ["Metal on metal" "Wood on wood" "Metal on wood" "Rubber on concrete"];
muList = [0.2 0.35 0.4 0.7];

% prompt to enter values until valid
while true
    % print option and material information
    fprintf('Option Materials          %s\n',char(181));
    fprintf('%6.0f %18s %4.2f\n',[1:4;materials;muList]);
    % ask for inputs and check if valid
    W = input('\nWeight(W):');
    if W < 0 %weights can be 0 according to the task
        clc
        fprintf('Error! Wieght cannot be negative!\n\n')
        continue
    end
    m = input('Materials Option:');%only uses option numbers
    if ~sum(logical(1:4==m))
        clc
        fprintf('Error! Materials Option must be an integer from 1 to 4!\n\n')
        continue
    end
    break
end

% use switch instead of accessing muList as instructed
switch m
    case m==1
        mu = 0.2;
    case m==2
        mu = 0.35;
    case m==3
        mu = 0.4;
    otherwise
        mu = 0.7;
end

% print materials used and force required
F = mu*W;
fprintf('\nMaterials chosen: %s\nForce required to start moving weight is %fN ',materials(m),F);

