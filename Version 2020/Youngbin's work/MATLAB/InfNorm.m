function N = InfNorm(A)
%The given set of matrix
A = [6 3 11 -1 2; 3 -2 7 0 4; 3 2 -6 5 -3; -5 7 1 -4 0];
[R,C]=size(A);
Row_sums=zeros(R,1);
%finds the maximum value of the added row
for i=1:R
    Row_sums(i) = sum(abs(A(i,:)));
    max = Row_sums(1);
    for i=1:R-1
        if Row_sums(i+1) > max
            max = Row_sums(i+1);
        end
    end
end 
N = max;
