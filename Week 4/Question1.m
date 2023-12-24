clearvars
clc

f = @(x) x.^3 + 3.8*x.^2 - 8.6*x - 24.4;

fprintf("Newton Raphson Method \n");
% Newton Rhapson Method
f_der = @(x) 3*x.^2 + 7.6*x - 8.6;
sol = 2;
for i=1:5
    sol = sol - (f(sol) / f_der(sol));
    if i == 5
        fprintf("Final root: ");
    end
    disp(sol);
end

x = linspace(0, 3);
hold on
plot(x, f(x), "k")
plot(x, zeros(1,length(x)), "k")
plot(sol, f(sol), "Or")

fprintf("Secant Method \n");
% Secant Method
x1 = 2;
x2 = 3;
root = 0;
for i=1:5    
    root = x2 - f(x2)/((f(x1)-f(x2))/(x1-x2));
    x1 = x2;
    x2 = root;
    if i == 5
        fprintf("Final root: ");
    end
    disp(root);
end