clc; clear; close all;

%%
s1=@(t) 5*exp(-0.5*t);
s2=@(t) 1+2*sin(0.1*3.1415926*t);

s11=@(t) s1(t)-1;
[r1,i1]=falseposition(s11,0,20,0.001);
fprintf('false position method\n time taken to reach s1=1: %.4f\n number of iterations: %.0f\n\n',r1,i1)

s22=@(t) s2(t)-2;
t1=fzero(s22,[0 8]);
t2=fzero(s22,[8 20]);
fprintf('fzero\n lower time to reach s2=2: %.4f\n higher time to reach s2=2: %.4f\n',t1,t2)

%%
tL=[0 10 15 30 35 50 55];
tU=[5 15 20 35 40 55 60];
s=@(t) s1(t)-s2(t);

root=zeros(length(tL),2); %column 1: root, column 2: iterations
for i=1:length(tL)
    [root(i,1),root(i,2)]=bisection(s,tL(i),tU(i),0.01);
end

l=root(:,2)==min(root(:,2));
min_tL=tL(l);
fprintf('\nintersection points\n tL value with least number of iterations: %.0f\n',min_tL)
fprintf(' number of iterations for tL: %.0f\n corresponding time value: %.4f\n',root(l,2),root(l,1))