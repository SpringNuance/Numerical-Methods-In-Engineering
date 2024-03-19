function x=gauss(A,b)
% A coefficient matrix
% b right hand side column vector 
n = length(b);
% Elimination phase 
for k=1:(n-1)
    for i=(k+1):n
        lambda = A(i,k)/A(k,k);
        A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n) ;
        b(i) = b(i)-lambda*b(k);
    end
end 
% Back substitution case
for j=n:-1:1
    b(j) = b(j) - A(j,j+1:n)/A(j,j);
end 
x=b;
