function x = LUsolut(A, b)
%LUSOLUT Summary of this function goes here
%   Detailed explanation goes here
    size_b = size(b);
    if size_b(1) == 1
            b = b';
    end
    n = size_b(2);
    
    % Forward Substitution
    for i=2:n
        for j=1:i-1
            b(i) = b(i) - A(i, j)*b(j);
        end
    end

    % Back Substitution
    for i = n:-1:1
        lambda = A(i, i);
        for j=i+1:n
            b(i) = (b(i) - A(i, j)*b(j));
        end
        b(i) = b(i) / lambda;
    end
    x = b;
    return
end

