function LU = LUdecom(A)
%LUDECOM Summary of this function goes here
%   Detailed explanation goes here
    size_a = size(A);
    n = size_a(2);
    L = zeros(size_a(1), size_a(2));
    
    % Elimination Phase
    for i=1:n
        for j=i+1:n
            lambda = A(j, i)/A(i, i);
            L(j, i) = lambda;
            for k=1:n
                A(j, k) = A(j, k) - lambda * A(i, k);
            end
        end
    end
    LU = A + L;
    return
end
