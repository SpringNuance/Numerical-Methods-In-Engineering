clearvars
close all
clc

f = @(v) [2*v(1)^2*v(2)-1; v(1)^3/20 + v(2)-10];
Jf = @(v) [4*v(1)*v(2) 2*v(1)^2; 3/20*v(1)^2 1];
[rootvals,iter] = NewtonManyVariables([5 1]',f,Jf,0.00005)