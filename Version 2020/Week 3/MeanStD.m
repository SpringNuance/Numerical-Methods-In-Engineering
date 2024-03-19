function [A,s] = MeanStD(x)
    n = length(x);
    A = sum(x)/n;
    s = sqrt((sum((x).^2) - n*(A^2)) / (n-1));
end