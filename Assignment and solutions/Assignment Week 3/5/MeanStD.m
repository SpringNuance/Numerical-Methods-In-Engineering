function [M, S] = MeanStD(x)
% The function returns the mean value M and the stadard deviation S
n = length(x);
M = x(1);
ssq = 0;
for j   = 2:n
    M   = ( (j-1)*M + x(j) )/ j ;
    ssq = ( (j-2)*ssq + j*(x(j) - M)^2/(j-1) ) / (j-1);
end
S = sqrt(ssq);