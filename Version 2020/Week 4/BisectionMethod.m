% 2rsin(theta)/3theta = r/2 -> 4 sin(theta) - 3theta = 0
format long

f = @(x) 4*sin(x) - 3*x;
a = 1;
b = 2;

tol = (b - a)/2;
x_previous = (a + b)/2;
i = 0;
while (tol > 0.002 && f(a)*f(b) < 0)
    prev_x = x_previous;
    if f(a)*f(x_previous) < 0
        b = x_previous;
    else
        a = x_previous;
    end
    x_previous = (a + b)/2;
    tol = (b - a)/2;
    err = abs((x_previous - prev_x)/prev_x);
    i = i + 1;
end
disp(x_previous)