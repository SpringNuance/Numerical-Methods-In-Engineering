clearvars 
clc
close all

a=-1; b=1;
N=8;
h=(b-a)/N;
x=a:h:b;
y=sqrt(1-x.^2);
I=h/3*(y(1)+4*sum(y(2:2:N))+2*sum(y(3:2:(N-1)))+y(N+1))