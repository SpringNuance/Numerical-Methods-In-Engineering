clearvars
close all
clc
n=input('Enter a number of terms of the series:\n');
total=0;
for i=1:n
total = total + (((-1)^(i-1)))/(2*i-1);
end
num_pi = 4*total; true_pi= pi;
total_rel_error = abs((true_pi-num_pi)/true_pi);
percent = total_rel_error*100;
fprintf('For n=%3i, the calculated value of pi is %9.5f\n',n,num_pi)
fprintf('The true relative error is %9.5e or %6.3f percent \n',...
total_rel_error,percent)