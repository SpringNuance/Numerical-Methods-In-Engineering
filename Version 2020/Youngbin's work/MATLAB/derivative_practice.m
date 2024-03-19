clear;
clc;
close all
syms x y z
f1=x^2+1;
f2=x^6*sin(x^2)^2+cos(x)*tan(x);
df_dx1=diff(f1,x);
df_dx2=diff(f2,x);
hold on
fplot(f1, 'r-')