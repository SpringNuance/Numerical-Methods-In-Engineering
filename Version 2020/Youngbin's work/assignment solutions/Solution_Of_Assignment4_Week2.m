% Solution of Assignmnet 4 of week 4
% Example 1: 5x2+6x-20=0
p=[5 6 -20];
Roots_Eq_1=roots(p)
%Example 2: sin(x) cos2(x)+1e-4=0
func=@(x) sin(x)*(cos(x))^2+1e-4;
%the three sample roots
Roots_Eq_2_sample1=fzero(func, 0)
Roots_Eq_2_sample2=fzero(func, 2)
Roots_Eq_2_sample3=fzero(func, 5)
