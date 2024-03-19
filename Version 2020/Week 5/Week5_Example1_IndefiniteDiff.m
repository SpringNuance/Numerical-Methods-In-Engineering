clear;
clc;
close all

syms x % Essential to use Sybolic Math Toolbox 
f1=x^2+1 % as Simple as writing in your notebook
df1=diff(f1) % It is only an example for derivatives, there are a lot of other functions and benefits
f2=x^6*(sin(x^2))^2+cos(x)*tan(x);
df2=diff(f2)
figure (1); fplot(f1,'-'); % check how fplot works compared to plot which needs actucal dataset
hold on % to add extra things (curve, box, note, etc.) to the exiting active figure
fplot(df1,'.--')
xlabel ('x');
ylabel('f1, df1/dx');
legend('f1', 'df1/dx');
title('f1');
grid on % to add grid to the active plot

figure (2); fplot(f2,'-');
hold on
fplot(df2,'.--')
xlabel ('x');
ylabel('f2, df2/dx');
legend('f2', 'df2/dx');
title('f2');
grid on
