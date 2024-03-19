clearvars
close all
clc

F=[24.6 29.3 31.5 33.3 34.8 35.7 36.6 37.5 38.8 39.6 40.4];
L=[12.58 12.82 12.91 12.95 13.05 13.21 13.35 13.49 14.08 14.21 14.48];
A0=1.25*10^-4;
L0=0.0125;

for i=1:length(F)
    sigmat(i)=(F(i)/A0)*(L(i)/L0);
    epsilont(i)=log(L(i)/L0);
end

[A,B]=LinearRegression(log(epsilont),log(sigmat))
m=A;
k=exp(B);
