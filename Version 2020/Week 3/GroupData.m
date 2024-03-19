function [f, X] = GroupData(x)
    xmin = fix(min(x));
    xmax = fix(max(x));
    X = xmin:1:xmax;
    f = zeros(1, length(X));
    for i = 1:length(X)
        for j = 1:length(x)
            if x(j) >= X(i)-0.5 && x(j) < X(i)+0.5
                f(i) = f(i) + 1;
            end
        end
    end
end
