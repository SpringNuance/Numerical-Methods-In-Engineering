clearvars
close all
clc

% use fzero
xf = fzero(@(x) x^3+12*x^2-100*x-6,[4; 6])

% use roots
p  = [1 12 -100 -6];
xr = roots(p)