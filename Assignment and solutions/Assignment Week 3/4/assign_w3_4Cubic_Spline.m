clearvars
close all
clc

global x y k N

x = [10 25 40 55];
y = [12 26 28 30];


A = [2*(x(1)-x(3))    (x(2)-x(3));
       (x(2)-x(3))  2*(x(2)-x(4))];

b = 6*[d_d(1,2)-d_d(2,3);
       d_d(2,3)-d_d(3,4);]; 

k = A\b; % k(1)= k2, k(2)=k3

Xint = 30;
dt   = 0.1;
N = length(x);
for i=1:N-1
    if Xint>=x(i) && Xint<=x(i+1)
        [k1,k2] = coeff_k(i);
        Yint    = c_s_L(Xint,k1,k2,i,i+1);
        break
    end
end

scatter(x,y)
axis equal
box on
for i=1:N-1
    X = x(i):dt:x(i+1);
    YintV = zeros(1,length(X));
    for j=1:length(X)
        if X(j)>=x(i) && X(length(X))<=x(i+1)
            [k1,k2] = coeff_k(i);
        end
        YintV(j)  = c_s_L(X(j),k1,k2,i,i+1);
    end
    hold on
    plot(X,YintV)
    clear X YintV
end