function b = myfunction(a)
b = squareMe(a)+doubleMe(a);
end
function y = squareMe(x)
y = x.^2;
end
function y = doubleMe(x)
y = x.*2;
end
