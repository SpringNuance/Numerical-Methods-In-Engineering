function [a,Er] = CubPolFit(x, y)
    % Initialize matrix xsum and vector ysum
    pow = 3; %n-th fit polynomial: works for all!
    xsum = zeros(pow + 1,pow + 1);
    ysum = zeros(pow + 1,1);
    
    % Fill in matrix xsum and vector ysum
    for i = 1:pow + 1
        for j = 1:pow + 1
            summ = 0;
            for k = 1:length(x)
                x_power = 1;
                for m = 1:i+j-2
                    x_power = x_power * x(k);
                end
                summ = summ + x_power;
            end
            xsum(i,j) = summ;
        end
        summ = 0;
        for k = 1:length(x)
            x_power = 1;
            for m = 1:i-1
                x_power = x_power * x(k);
            end
            summ = summ + y(k) * x_power;
        end
        ysum(i) = summ;
    end
    
    % Solve for the coefficients
    a = xsum\ysum;
    a = a';
    f = a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3;
    Er = sum((y - f).^2);
    return
end