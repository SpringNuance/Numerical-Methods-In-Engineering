function infNorm = infNorm(A)
%INFNORM Summary of this function goes here
%   Detailed explanation goes here
    size_a = size(A);
    max_sum = 0;
    for i=1:size_a(1)
        current_sum = sum(abs(A(i, :)));
        if current_sum > max_sum
            max_sum = current_sum;
        end
    end
    infNorm = max_sum;
end

