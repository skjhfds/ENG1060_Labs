function mrGraphy(data,cols,n,f)
% import data
D = importdata(data);
x = D.data(:,cols(1));
y = D.data(:,cols(2));
xl = D.colheaders{cols(1)};
yl = D.colheaders{cols(2)};

% plot
clf(figure(f))
figure(f)  %figure f
plot(x,y,'xk')
title(sprintf('%s against %s',yl,xl))
xlabel(xl)
ylabel(yl)

% find function of best fit
p = polyfit(x,y,n);
domx = min(x):0.1:max(x);
hold on
plot(domx, polyval(p, domx), '--r')
switch mod(n,10)
    case 1
        o = sprintf('%gst',n);
    case 2
        o = sprintf('%gnd',n);
    case 3
        o = sprintf('%grd',n);
    otherwise
        o = sprintf('%gth',n);
end

% legend
legend(yl,sprintf('%s order Polynomial of Best Fit',o), 'Location','southoutside')

% output function of best fit as string
p = fliplr(p); % remember to flip because polyfit is doodoo
func = "f(x) = ("+num2str(abs(p(1))) + ")";
for i = 2:length(p)
    if p(i)<0
        func = func + "- (";
    else
        func = func + "+ (";
    end
    func = func + num2str(abs(p(i))) + ")x^(" + num2str(i-1)+ ") ";
end
fprintf('Function of Best Fit is:\n%s\n',func)