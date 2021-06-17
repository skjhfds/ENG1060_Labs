function [A,B] = fit_exp (CBED_data)
y = CBED_data(:,1);
x = CBED_data(:,2);

p = polyfit(x,log(y),1);
A = exp(p(2));
B = p(1);

yfit = A.*exp(B.*x);
plot(x,y,'rs'); hold on
plot(x,yfit)
title('CBED Data')
xlabel('Time (min)')
ylabel('\Omega')
legend('Data','Exponential fit','Location','best')

yfit = @(x) A*exp(B*x);
i= 0;
while yfit(i) >= .0001
    i = i+1;
end
i
