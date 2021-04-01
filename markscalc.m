function [final_mark, grade] = markscalc(lab, assignment, other, exam)
%
% [fm,lg] = grade(lab,ass,oth,exa)
% Written by: Harry Choi, 32464223
% Created on 2-Apr-2021
% The grade function takes a student's various marks
% and calculates their final mark and letter grade.
% 
% Input arguments
% -----------------
%        lab Lab marks
% assignment Assignment mark
%      other Other in-semester marks
%       exam Exam mark
%
% Output arguments
% -----------------
% final_mark Final mark
%      grade Letter grade
%
final_mark = round(sum(2.5.*lab./10) + 10*assignment/10 + 15*other/15 + 50*exam/100);
if final_mark >= 80
    grade = 'HD';
elseif final_mark >= 70
    grade = 'D';
elseif final_mark >= 60
    grade = 'C';
elseif final_mark >= 50
    grade = 'P';
else
    grade = 'N';
end