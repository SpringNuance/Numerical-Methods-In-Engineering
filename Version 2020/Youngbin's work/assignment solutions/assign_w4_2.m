clearvars
close all
clc

A0= 1.25e-4; L0=0.0125;
F=[24.6 29.3 31.5 33.3 34.8 35.7 36.6 37.5 38.8 39.6 40.4]*1000;
L=[12.58 12.82 12.91 12.95 13.05 13.21 13.35 13.49 14.08 14.21 14.48]*0.001;
n=length(F);
St=F.*L/(A0*L0);
EPt=log(L/L0);
Y=log(St);
X=log(EPt);
% p=polyfit(X,Y,1)
[a1,a0]=LinearRegression(X,Y);
m=a1
K=exp(a0)
x=linspace(EPt(1),EPt(n),30);
y=K*x.^m;
plot(x,y)
hold on
plot(EPt,St,'*r')
xlabel('True Strain'), ylabel('True Stress (Pa)')