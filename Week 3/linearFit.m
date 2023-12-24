format short
clear
clearvars
clc
F = [24.6 29.3 31.5 33.3 34.8 35.7 36.6 37.5 38.8 39.6 40.4];
L = [12.58 12.82 12.91 12.95 13.05 13.21 13.35 13.49 14.08 14.21 14.48];

Ao = (1.25*(10)^-4);
Lo = 0.0125;
AoLo = Ao*Lo;

% ln(sigma) = m * ln(eps) + ln(K)
% m = a1 ; ln(K) = a0

x1 = log(L / Lo);
x = log(x1);
y1 = (F.*L) ./ AoLo;
y = log(y1);

nx=length(x);
ny=length(y);
Sx=sum(x);
Sy=sum(y);
Sxy=sum(x.*y);
Sxx=sum(x.^2);
a1=(nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
a0=(Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);

disp(a1)
disp(exp(a0))

f = @(x) a1*x + a0;
l = linspace(min(x), max(x));

plot(x, y, '*r')
hold on
plot(l, f(l), 'k')