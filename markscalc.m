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
lab_ = sum(2.5.*lab./10);
ass  =      assignment/10;
oth  = 15 * other/15;
exa  = 50 * exam/100;
final_mark = lab_ +ass +oth +exa;
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