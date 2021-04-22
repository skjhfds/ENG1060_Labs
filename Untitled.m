clear; clc
np =[];
for n=1:10000
    n3 = fliplr(num2str(n^3));
    
    f = true;
    it=1;
    for d = fliplr(num2str(n))
        if d ~= n3(it)
            f = false;
            continue
        end
        it = it + 1;
    end
    if f
        np(end+1) = n;
    end
end
np