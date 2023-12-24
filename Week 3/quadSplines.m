format short
clear
clearvars
clc
x = [10 25 40 55 70]; 
y = [12 26 28 30 24];

n = length(x) - 1;

% Right hand side
temp = zeros(1, 3*n - 1);
temp(1) = y(1);
j = 2;
for i=2:2:length(temp)
    if i >= 2*n
        break
    end
    temp(1, i:i+1) = [y(j) y(j)];
    j = j + 1;
end
temp(2*n) = y(n+1);
b = temp';

A = zeros(length(b));

%Condition 1: Each equation passes through endpoints.
j = 1; %Counter for power
k = 1; %Every k-th row is similar
for i = 1:2:2*n
    A(i, k:k+2) = [x(j)^2 x(j) 1];
    j = j + 1;
    A(i+1, k:k+2) = [x(j)^2 x(j) 1];
    k = k + 3;
end

%Condition 2: Slopes of interior knots should be equal.
j = 1;
l = 2;
for i=2*n+2:3*n
    A(i, j:j+1) = [2*x(l) 1];
    A(i, j+3:j+4) = [-2*x(l) -1];
    j = j+3;
    l = l+1;
end

%Condition 3: Initial condition of a1 = 0
A(:, 1) = []; 
A(9, :) = [];

z = A\b;
disp(z)
st = 0.1;
x1 = (x(1):st:x(2));
x2 = (x(2):st:x(3));
x3 = (x(3):st:x(4));
x4 = (x(4):st:x(5));

f1 = @(x) z(1)*x + z(2);
f2 = @(x) z(3)*x.^2 + z(4)*x + z(5);
f3 = @(x) z(6)*x.^2 + z(7)*x + z(8);
f4 = @(x) z(9)*x.^2 + z(10)*x + z(11);

P1 = 30;
P2 = 65;

disp(f2(P1));
disp(f4(P2));

figure(1)
hold on
plot(x1, f1(x1), 'k', x2, f2(x2), 'k', x3, f3(x3), 'k', x4, f4(x4), 'k', x, y, '*r', P1, f2(P1), 'Ob', P2, f4(P2), 'Ob')
box on
