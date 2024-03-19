function xo = usesort(x)
    n = length(x);
    for i=1:n
        for j=1:n-i
            if x(j) > x(j+1)
                temp = x(j);
                x(j) = x(j + 1);
                x(j + 1) = temp;
            end
        end
    end
    xo = x;
end