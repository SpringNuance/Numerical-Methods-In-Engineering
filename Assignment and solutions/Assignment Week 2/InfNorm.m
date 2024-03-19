function N = InfNorm(A)
[R,C]=size(A);
Row_sums = zeros(R,1);
for i=1:R
    Row_sums(i) = sum(abs(A(i,:)));
end
max = Row_sums(1);
for i=1:R-1
    if Row_sums(i+1) > max
        max = Row_sums(i+1);
    end
end
N = max;