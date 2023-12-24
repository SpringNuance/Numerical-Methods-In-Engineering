function x = Gauss_alt_pivot(a, b)
    size_b = size(b);
    if size_b(1) == 1
            b = b';
    end
    n = size_b(2);
    for i=1:n-1
        if a(i, i) == 0
            for k=i+1:n
                if a(i, k) ~= 0
                    temp_a = a(i, :);
                    temp_b = b(i, 1);
                    a(i, :) = a(k, :);
                    a(k, :) = temp_a;
                    b(i, 1) = b(k, 1);
                    b(k, 1) = temp_b;
                end
            end
        end
    end

    x = zeros(n, 1);
    aug = [a, b];
    size_aug = size(aug);
    % Elimination Phase
    for i=1:n
        for j=i+1:n
            lambda = aug(j, i)/aug(i, i);
            aug(j, :) = aug(j, :) - lambda * aug(i, :);
        end
    end
    disp(aug)
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