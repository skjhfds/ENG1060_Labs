nMax = 50;
a = 10:25;
b = 5:30;

n = 1:nMax;

% a by n, a and n
anA = a'*ones(1,length(n));
anB = ones(length(a),1)*n;
pa = anA.^anB*ones(length(n),1)*ones(1,length(b))
pb = ones(length(a),1)*n*