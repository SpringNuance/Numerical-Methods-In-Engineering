% shows the solutions for the first example: 5x^2+6x-20=0
p = [5 6 -20];
disp(roots(p))

% shows the solutions for the second example: sin(x)cos(x)^2+1e^-4=0
f = [-1 0 1 1e4*eps];
put = roots(f); 
solution = asin(put);
disp(solution)
