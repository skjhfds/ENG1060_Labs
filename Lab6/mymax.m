function [max_value, index] = mymax(x)
max_value = x(0);
index = [0];
i=linspace(0,50,0.001)
for i=linspace(0,50,0.001)
    i
    switch x(i)
        case x(i) > max_value
            max_value = x(i);
            index=[i];
        case max_value
            index(end+1)=i;
    end
end