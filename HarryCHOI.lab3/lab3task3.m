% Harry Choi 32464223
% 25-Mar-2021
% Lab 3 Task 3
% Graphs VO2 max against hours trained weekly and calculates the hours
% trained weekly by Tzekih
clear; close all; clc

%create range of times
z = 0:0.5:40;
dtd = [5,12,17,32,38]; %demonstrator training data
dnd = ["Chris","Andrew","Tzekih","Egan Bernal","Lance Armstrong"]; %demonstrator name data

%plot graph
plot(z,vo2max(z),"--b")
grid on
title("VO2 Max against Hours Trained Weekly (t)")
xlabel("Hours Trained Weekly")
ylabel("VO2 Max (mL/kg/min)")

%plot points of demonstrators
hold on
plot(dtd,vo2max(dtd),"ok")
text(dtd+1,vo2max(dtd),dnd) %spaced the labels out a little

%calculate Tzekih hours
tVo2 = 53.3729;
e = 0.5*find(vo2max(z)<tVo2+5|vo2max(z)>tVo2-5); %creates list of hours that produce VO2 maxes +/-1 of Tzekih's
diff = abs(vo2max(e)-tVo2); %difference to real value
[m,i] = min(diff); %finds index of lowest difference to real value
fprintf('Tzekih''s hours trained estimated from his VO2 max is %.1f hours.',e(i)) %use index to find corresponding hours trained weekly
fprintf('\nThe find function is not a very good fit as Tzekih''s actual hours trained was %.1f hours.',dtd(dnd=="Tzekih"))