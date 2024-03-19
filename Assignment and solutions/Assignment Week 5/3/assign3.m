clearvars
close all
clc

x = [0.76 6.66 9.44 16.8];
y = [3.74 4.90 9.97 9.62];

n   = length(x);
spl = spline(x,y);
bk  = spl.breaks;
cf  = spl.coefs;
x1  = x(1):n/1000:x(n); 
y1  = spline(x,y,x1);
scatter(x,y)
hold on
plot(x1,y1)
box on
axis equal

xi  = 15;
for i=1:n-1
    if xi>=x(i) && xi<=x(i+1)
        dxi  = 3*cf(i,1)*(xi-x(i))^2 + 2*cf(i,2)*(xi-x(i)) + cf(i,3);
        ddxi = 6*cf(i,1)*(xi-x(i))   + 2*cf(i,2);
        break
    end
end