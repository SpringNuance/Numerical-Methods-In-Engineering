function x = solve(x)
for numIter = 1:30
dx = -(sin(x) - 0.5*x)/(cos(x) - 0.5); % -f(x)/f '(x)
x = x + dx;
    if abs(dx) < 1.0e-6 % Check for convergence
        return
    end
end
error('Too many iterations')