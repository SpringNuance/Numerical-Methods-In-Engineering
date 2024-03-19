% Partial Derivatives with Symbolic Mathwork Toolbox
clear;
clc;
close all
syms x  y  z
f1=x^2*y+x*y*z-z^3+1;
df_dx=diff(f1,x)
df_dy=diff(f1,y)
df_dz=diff(f1,z)

