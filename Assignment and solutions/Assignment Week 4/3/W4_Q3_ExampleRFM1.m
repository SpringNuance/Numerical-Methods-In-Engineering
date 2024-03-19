clearvars
close all
clc
format long

func = @(x)  x^3+12*x^2-100*x-6;
a = 4;
b = 6;

Xs = RegulaFalsiRootMod1(func,a,b,00001)