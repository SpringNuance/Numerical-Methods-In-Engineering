clearvars 
clc
close all

a=-1; b=1;
N=9;
h=(b-a)/N;
x=a:h:b;y=sqrt(1-x.^2);
I = 3*h/8*(y(1)+3*sum(y(2:3:(N-1)))+3*sum(y(3:3:N))...
    +2*sum(y(4:3:(N-2)))+y(N+1))