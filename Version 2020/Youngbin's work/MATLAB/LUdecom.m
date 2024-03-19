%This function sets up the decomposition for A = LU
function A = LUdecom(A)

A = [1 2 -2; 2 3 1; 3 2 -4];
n = size(A,1);
for k = 1:n-1
    for i = k+1:n
        if A(i,k)~= 0.0
            lambda = A(i,k)/A(i,k);
            A(i,k+1:n) = A(i,k+1:n) - lambda*A(k,k+1:n);
            A(i,k) = lambda;
        end
    end
end

