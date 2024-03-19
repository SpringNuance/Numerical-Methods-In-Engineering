format short
clear
clearvars
clc
x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0, 4.4, 4.8, 5.2, 5.6, 6.0];
y = [0 3.0 4.5 5.8 5.9 5.8 6.2 7.4 9.6 15.6 20.7 26.7 31.1 35.6 39.3 41.5];

plot(x, y, '*r')
hold on

[a, Er] = CubPolFit(x, y);
disp(a)
disp(Er)
x1 = linspace(0, 7);
%f4 = @(x) a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3 + a(5)*x.^4;
f3 = @(x) a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3;

plot(x1, f3(x1), 'k');
