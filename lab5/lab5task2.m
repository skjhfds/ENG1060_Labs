clc
valid = 0;
materials = ["Metal on metal" "Wood on wood" "Metal on wood" "Rubber on concrete"];
muList = [0.2 0.35 0.4 0.7];
fprintf('Option Materials          %s\n',char(181));
fprintf('%6.0f %18s %4.2f\n',[1:4;materials;muList]);
while ~valid
    W = input('Weight(W):');
    m = input('Materials:');%only uses option numbers
    if W > 0 && m > 0 && m <= 4
        valid = 1;
    end
end

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

F = mu*W;

fprintf('Materials chosen: %s\nForce required to start moving weight is %fN ',materials(m),F);

