function [max_value, index] = mymax(x)
max_value = x(1);
index = [1];
for i=2:length(x)
    if x(i) > max_value
        max_value = x(i);
        index=[i];
    elseif x(i)==max_value
        index(end+1)=i;
    end
end