close all; clear; clc
% subplot(4, 5, [6, 7])
% plot(0,0)
%% q17 24
% % f = @(x) log10(3*x^2-5)-10;
% f = @(x) x^2 -3*x*exp(-x) -4;
% % xl = 4e4;
% % xu = 1e5;
% xl = .5;
% xu = 5;
% fLower = f(xl);
% %first guess for root can be as close to precision as f(xl)
% fRoot = fLower;
% iter = 0;
% while true
%     iter = iter + 1;
%     root = 0.5*(xl + xu);
%     fRoot = f(root);
%     if fLower*fRoot>0
%         xl = root;
%         fLower = fRoot;
%     else
%         xu = root;
%     end
%     if iter == 7
%         break
%     end
% end
% root
%% 25
% M = importdata('master_matrix.txt');
% i = 1;
% sum1 = 0;
% while i < 100
%     sum1 = sum1 + sum(M(:,i));
%     i= i + 4;
% end
% sum1
% r1 = M(1,:);
% r2 = M(56,:);
% r3 = M(67,:);
% r4 = M(90,:);
% sum(sum([r1(1,[5,18,44,70]);
%     r2(1,[5,18,44,70]);
%     r3(1,[5,18,44,70]);
%     r4(1,[5,18,44,70])    
%     ]))
% products = [];
% for i = 1:100
%     row = M(i,:);
%     for j = 1:100-2
%         products = [products;row(j)*row(j+1)*row(j+2)];
%     end
% end
% max(products)
%% q27
% fprintf('Pi is about %d',pi());
%% q28
% f = @(x) 5*x^5 - 4*x^4 + 3*x^3 - 2*x^2 + x -9;
% df = @(x) 25*x^4 - 16*x^3 + 9*x^2 - 4*x + 1;
%  [root, iter] = newraph(f,df,-3,1e-6)
%% q29
% dydx = @(x,y) ( 3*x*y - exp(-(x*y)^2) )/( exp(-(x*y)^2) - x*y );
% % [t,y] = euler(dydx,[0,5],6,.2);
% % y(end)
% % [t,y] = midpoint(dydx,[0,5],6,.2);
% % y(end)
% [t,y] = heun(dydx,[0,8],6,.2);
% y(end)
%% 30
% E = 200e3;
% I = 84.8e6;
% L = 5e3;
% P = 40e3;
% v = 50;
% f = @(x) P*x^2/6 * (3*L-x) - E*I*v;
% fprintf('x= %.0f',modisecant(f, L/2, .01, 1))
%% 32
% BMI_list = importdata('BMI.txt').data;
% id = BMI_list(:,1);
% h= BMI_list(:,2);
% w= BMI_list(:,3);
% % w(231);
% % [m,i] = max(id)
% % h(i)
% BMI_list=[BMI_list,BMI_list(:,3)./(BMI_list(:,2)/100).^2];
% bmi = BMI_list(:,4);
% % bmi(592)
% % i =0;
% % for s = 1:length(bmi)
% %     if bmi(s) > 25.5 && 30 >= bmi(s)
% %         i = i+1;
% %     end
% % end
% % i
% % i/length(bmi)
% % BMI_list=BMI_list(logical(BMI_list(:,2)<190),:);
% % bmi = BMI_list(:,4);
% % i =0;
% % for s = 1:length(bmi)
% %     if bmi(s) > 25.5 && 30 >= bmi(s)
% %         i = i+1;
% %     end
% % end
% % i
% % i/length(bmi)
% categorise_BMI(1,BMI_list)
% bmi(1)
%% 34
% CBED_data = importdata('CBED.csv').data;
% fit_exp(CBED_data);
% x = CBED_data(:,1);
% y = CBED_data(:,2);
% [M,C] = linreg(x,y);
% expval(expfit(x,y),1);
% for i = 1:100
%     if expval(expfit(x,y),i) < .0001
%         break
%     end
% end
% i
%% 38
% D = importdata('Stress-strain.txt').data;
% x = D(:,2);
% y = D(:,1);
% t = comp_trap_vector(x,y);
% fprintf('Toughness: %.4f',t)
%% 42
% x = 2:7;
% y = [11;37;102;197;334;521];
% plot(x,y)
%%
% [t,y] = ode45(@(t,y) 3*t, [0 10], 0)
% x = [2;2]
% y = rand(length(x))
% X = zeros(10,10);
% X(1,2) = -1;
%% 22
% dydx =@(x,y) ( 2*y*exp(-x) - 3*x*y )/( 2*x^2 + y^2 + 1);
% for i = [2,5,10]
%     [t,ye] = midpoint(dydx,[0,i],3,.1);
%     ye(end)
% end



















