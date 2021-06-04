function [root,iter,i,j] = falseposition(f,xl,xu,precision)

%[root,iter] = falseposition(f,xl,xu,precision)
%
%Created by Hannah Tay 32521987
%Date created: 27th April 2021
%
%EDITED VERSION FOR CONSOLIDATION QUIZ
%
%%finds the root of the given function f which lies between 
%the two initial guesses of xl and xu (where f changes sign)
%
%falseposition function guesses the root,xr, to be where the chord
%passing through [xl,f(xl)] and [xu,f(xu)] crosses the horizontal
%axis
%
%if f(xl) * f(xr) > 0, xl is set to xr
%if f(xl) * f(xr) < 0, xu is set to xr
%
%this process is repeated until the difference between 
%f(xr) and 0 is the precision value
%
%
%inputs: f(function),xl(lower limit),xu(upper limit),precision
%outputs: root,iterations required to find the root within the 
%specified precision

%function commands:

iter=0;
fxl=f(xl);
fxr=2;
i=0; j=0;

while abs(fxr-0)>precision
    xr=(f(xu)*xl-f(xl)*xu)/(f(xu)-f(xl));
    fxr = f(xr);
    if fxl*fxr>0
        xl=xr;
        fxl=fxr;
        j=j+1; %counting the number of times xl is changed
    else
        xu=xr;
        i=i+1; %counting the number of times xu is changed
    end
    iter=iter+1;
end
root=xr;
end
