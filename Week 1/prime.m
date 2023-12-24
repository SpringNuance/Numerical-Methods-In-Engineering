clearvars
clc
close all

x = input("Enter number here: ");
result = isPrime(x);
fprintf("%s \n", string(result))

function res = isPrime(x)
    if x == 2
        res = true;
        return
    elseif mod(x, 2) == 0
        res = false;
        return
    elseif x > 2
        for i=2:((x^0.5)+1)
            if rem(x,i) == 0
                res = false;
                return
            end
        end
        res = true;
        return
    else
        res = false;
        return
    end
end