clearvars
close all
clc

[a, df] = DerivativeRidders(@(x) exp(x)/(sin(x)-x^2),1,0.01)