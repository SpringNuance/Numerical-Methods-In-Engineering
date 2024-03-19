p = [5 6 -20];
disp(roots(p))


f = [-1 0 1 1e4*eps];
put = roots(f);
solution = asin(put);
disp(solution)
