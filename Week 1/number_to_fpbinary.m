function [s, e, m] = number_to_fpbinary(y, p)

    %Check if y is within the range of -2^100 and 2^100
    if abs(y) > 2^100 || abs(y) < 2^-100
        error("Number is out of range. Please input number with abs val between 2^-100 and 2^100.");
    end

    %Check if precision is provided, if not set default value
    if nargin == 1
        precision = 1;
        bias = 127;
    else
        precision = p;
        %check precision value and set bias accordingly
        if precision == 1
            bias = 127;
        else
            bias = 1023;
        end
    end
    
    number = y;
    %Calculate sign bit
    s = number < 0;
    %Calculate exponent bits
    e = exponent(number, precision, bias);
    %Calculate mantissa bits
    m = mantissa(number, precision);
    return
    
end

function m = mantissa(number, precision)

    %Calculate mantissa 
    mantissa = mod(abs(number) / 2^(exponent(number, precision)), 1);
    %Number of bits for mantissa
    num_of_bits = 23;
    if precision == 2
        num_of_bits = 52;
    end

    %Convert mantissa to binary
    m = binary(mantissa, num_of_bits);
    return

end

function e = exponent(number, precision, bias)

    %Number of bits for exponent
    num_of_bits = 8;
    if precision == 2
        num_of_bits = 11;
    end

    %Calculate exponent
    pow = 1;
    while 2^(pow+1) <= abs(number)
        pow = pow + 1;
    end
    if abs(number) < 1
        pow = pow * sign(number);
    end

    if nargin < 3
        e = pow;
    else
        e = binary(pow + bias, num_of_bits);
    end
    return

end

function b = binary(number, num_of_bits)

    %Initialize binary array
    bin = zeros(1, num_of_bits);
    current_bits = 1;
    if number < 1
        %Convert decimal to binary
        while(number ~= 1 && current_bits ~= num_of_bits+1)
            number = mod(number, 1) * 2;
            if number >= 1
                bin(current_bits) = 1;
            end
            current_bits = current_bits + 1;
        end
    else
        %Convert decimal to binary
        while(number > 0 && current_bits ~= num_of_bits+1)
            if mod(number, 2) ~= 0
                bin(num_of_bits - current_bits + 1) = 1;
            end
            number = number / 2;
            number = number - mod(number, 1);
            current_bits = current_bits + 1;
        end
    end
    b = bin;
    return

end