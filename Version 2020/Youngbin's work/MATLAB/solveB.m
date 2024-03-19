function [x,numIter] = solveB(x, epsilon)
if nargin == 1 % Provide default value if second input is missing
epsilon = 1.0e-6;
end
for numIter = 1:30
dx = -(sin(x) - 0.5*x)/(cos(x) - 0.5); % -f(x)/f '(x)
x = x + dx;
if abs(dx) < epsilon % Check for convergence
    return
end
end
error('Too many iterations')