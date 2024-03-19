% For teh assignment 3 of week 6 Romberg Integration
function [I,FuncEvalCount] = romberg(IntegrandFunction,a,b,precision,Maximum_K)
% Romberg integration.

% INPUT:
% IntegrandFunction = handle of function being integrated.
% a,b = limits of integration.
% precision = the required error precision 
% Maximum_K = limit on the number of panel doublings

% OUTPUT:
% I = value of the integral.
% FuncEvalCount = number of function evaluations.

R = zeros(Maximum_K,1);
R(1) = Week6_Example_1_trapezoid(IntegrandFunction,a,b,0,1);
I_Old = R(1);
for k = 2:Maximum_K
    R(k) = Week6_Example_1_trapezoid(IntegrandFunction,a,b,R(k-1),k);
    R = richardson(R,k);
    if abs(R(1) - I_Old) < precision
        FuncEvalCount = 2^(k-1) + 1; I = R(1);
        return
    end
    I_Old = R(1);
end
error('Failed to converge')
function r = richardson(r,k)
% Richardson’s extrapolation 
    for j = k-1:-1:1
        c = 4^(k-j); r(j) = (c*r(j+1) - r(j))/(c-1);
    end
end
end