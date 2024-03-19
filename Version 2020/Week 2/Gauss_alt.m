function x = Gauss_alt(a, b)
    size_b = size(b);
    if size_b(1) == 1
            b = b';
    end
    n = size_b(2);
    x = zeros(n, 1);
    aug = [a, b];
    size_aug = size(aug);

    % Elimination Phase
    for i=1:n
        if aug(i, i) == 0
            error("Zero Pivot found, Use Gauss_alt_pivot function.")
        end
        for j=i+1:n
            lambda = aug(j, i)/aug(i, i);
            aug(j, :) = aug(j, :) - lambda * aug(i, :);
        end
    end

    % Back Substitution Phase
    x(size_aug(1)) = aug(size_aug(1), size_aug(2))/aug(size_aug(1), size_aug(2) - 1);
    for i=n-1:-1:1
        x(i) = aug(i, n+1);
            for j=i+1:n
                x(i) = x(i) - aug(i, j)*x(j);
            end
        x(i) = x(i)/aug(i, i);
    end
    return
end