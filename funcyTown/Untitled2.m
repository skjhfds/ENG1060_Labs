clc; clear; close all
% D = importdata('mock_Q3file.txt');
% m = max(max(D))
% sum(sum(logical(D==m)))

% s = size(D);
% for i = 1:s(1)
%     for j = 1:s(2)
%         if 100 <= D(i,j) && D(i,j) <= 200
%             D(i,j) = 100;
%         end
%         if 600 <= D(i,j) && D(i,j) <= 700
%             D(i,j) = 600;
%         end
%     end
% end
% total = sum(sum(D));
% fprintf('%16.0f', total)
%% sec 4
% [sa,v] = dode(10)
% fprintf('%.4f %.4f',sa,v)
% x = -5:0.1:5;
% a = sin(cos(x/2));
% [sa,v] = dode(a);
% [m,i] = max(sa)
% v(i)
% a(i)
%% sec 5
% clear all; close all; clc;
% % clear all doesn't make sense because clear just clears everything
% omegaD = 10.26;
% tD = linspace(0,1,200);
% y = @(t,xi,omega) 1 - exp(-xi*omega*t)/sqrt(1-xi^2) .* sin(omega*sqrt(1 - xi^2)*t + acos(xi));
% % top subplot
% subplot(2,1,1)
% xiD = 0.2:0.2:0.8;
% lstr = [];
% for xival = xiD
%     plot(tD,y(tD, xival, omegaD)); hold on
%     lstr = [lstr,sprintf("xi=%g",xival)];
% end
% title(sprintf('omega = %g',omegaD))
% xlabel('t')
% ylabel('y')
% legend(lstr, 'Location', 'best')
% % bottom subplot
% subplot(2,1,2)
% xival = 0.65;
% ya = y(tD, xival, omegaD);
% plot(tD,ya); hold on
% grid on
% title(sprintf('xi=%g, omega = %g',xival,omegaD))
% xlabel('t')
% ylabel('y')
% [m,i] = max(ya);
% plot(tD(i),m,'rd');
% legend('step response','maximum value', 'Location', 'southeast')

%% sec 6

% s1 = @(t) 5*exp(-0.5*t)-1;
% s2 = @(t) 1 + 2*sin(0.1*pi()*t)-2;
% % [r,i] = falseposition(s1,0,20,0.001)
% 
% % fzero(s2,15)
% 
% 
% 
% tL = [0, 10, 15, 30, 35, 50, 55];
% tU = [5, 15, 20, 35, 40, 55, 60];
% s1 = @(t) 5*exp(-0.5*t);
% s2 = @(t) 1 + 2*sin(0.1*pi()*t);
% s = @(t) s1(t)-s2(t);
% output = [];
% for tl = tL
%     for tu = tU
%         if s(tl)*s(tu)>0
%             continue
%         end
%         [root,iter] = bisection(s,tl,tu,0.01);
%         output = [output;root,iter];
%     end
% end
% iterlist = output(:,2);
% [m,i] = min(iterlist);
% fprintf('tL with min iter: %g\n iter:%g\n time:%g',tL(i),m,output(i,1))
%% sec 7
% T = [25;50;95;145;315];
% V = [.95;.48;.085;.011;.0008];
% [a0,a1,r2]=linreg(T,log(V)-3*log(T))
% exp(a0)
% [a0,a1,r2]=linreg(T,log(V))
% expval(expfit(T,V),1);
% exp(a1)
% p = polyfit(T,V,4)
% % p(2)
% % polyval(p,200)
% f = @(x) polyval(p,x)-1;
% fzero(f,50)

% polyval(p,25)
%% sec 8
t = 0:8;
v = [0;4;8;10;11;11.5;11.8;11.9;12];
g= 9.81;
m = 100;
c = 25;
vt = @(t) g*m/c*(1-exp(-c/m*t));
% % % % d = @(t) integral(vt,0,t);
% % % comp_trap(vt,0,8,3)
% % % 
% % % comp_simp13(vt,0,8,9)
% % % comp_simp38(vt,0,8,100)
% % 
% integ = integral(vt,0,20);
% % step 4
% t = trapz([0,20],vt([0,20]));
% n = 2;
% while abs(t-integ) > 0.5
%     n = n+1;
%     points = linspace(0,20,n);
%     temp = 0;
%     for i = 1:n-1
%         a = points(i);
%         b = points(i+1);
%         temp = temp + trapz([a,b],vt([a,b]));
%     end
%     t = temp;
% end
% fprintf('integ dist: %g\n min num points: %g',integ,n)


%% sec 9
% dydt = @(x,y) (1+0.5*x)/sqrt(2*y);
% % [t,y] = euler(dydt,[0,2],1,0.2)
% [t,y] =midpoint(dydt,[0,2],1,0.2)
% [t,y] = heun(dydt,[0,2],1,0.2)
% tstep = [.01; .1; .5; 1; 5];
% y_t50 = zeros(size(tstep));
% for i = 1:length(tstep)
%     [t,y] = euler(dydt,[0,50],1,tstep(i));
%     y_t50(i) = y(length(y));
% end
% sum(y_t50)
%% test
% G = [4, 7, 31, 14]
% % G.data(3)
% 
% 
% subplot(4,4,7)
% plot(G,G)

% my_sum = 1;
% for n = 1:1000000
%         my_sum = my_sum + 1e-17;
% end
% my_sum
% 
% 
% x = -999^-999

% f = @(x) 2*x^3 - x^2 + 3*x + 1;
% f(2)
% p= [-0.02, 3.5, 2, -1]
% polyval(p,5)

% A = [0 5 -8;
%     2 3 -9;
%     -7 8 -3]
% b = [4;
%     -2;
%     9]
% x = gauss(A,b)

% x = [1 2 3 4 5]
% y = [5 4 3 2 1]
% index = (logical(x)) && (logical(y))
% 
% f = @(x) 2*x^3 - x^2 + 3*x + 1;
% df = @(x) 6*x^2 - 2*x + 3;
% xi = 2;
% f(xi - f(xi)/df(xi))














