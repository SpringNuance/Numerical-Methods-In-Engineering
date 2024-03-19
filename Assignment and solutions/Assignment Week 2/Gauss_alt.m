function x = Gauss_alt(a,b)
% The function solves a system of linear equations [a] [x]
% elimination method.
% Input variables:
% a - The matrix of coefficients.
% b - Right-hand-side column vector of constants.
% Output variable:
% x - A column vector with the solution.
if size(b,2) > 1; b = b'; end % b must be column vector
ab     = [a,b];    % augmented matrix
[R, C] = size(ab); % number of rows and columns
% Forward elimination -----------------------------------------------------
for j=1:(R-1)
    for i=(j+1):R
        ab(i,j:C)= ab(i,j:C)- ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end
% Forward elimination -----------------------------------------------------
% Back substitution -------------------------------------------------------
x = zeros(R,1);
x(R)= ab(R,C)/ab(R,R);
for i= (R-1):-1:1
    x(i)= (ab(i,C) - ab(i,i + 1:R)*x(i + 1:R))/ab(i,i);
end
% Back substitution -------------------------------------------------------