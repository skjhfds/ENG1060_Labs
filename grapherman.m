function grapherman(a)
m=0.5; D=5; k=37; H=0.1; L=0.2;
domt = 0:0.01:2.5;
kam = k-a^2*m;
b = (-kam*k*H)/(kam^2+(a*D)^2);
c = (-a*D*k*H)/(kam^2+(a*D)^2);
f = @(t) b*cos(a*t) + c*sin(a*t);
plot(domt, f(domt)); hold on