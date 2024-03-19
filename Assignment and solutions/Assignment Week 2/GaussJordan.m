function x = GaussJordan(a,b)
% The function solve a system of linear equations ax=b using the Gauss
% elimination method with pivoting. In each step the rows are switched
% such that pivot element has the largest absolute numerical value.
% Input variables:
% a The matrix of coefficients.
% b A column vector of constants.
% Output variable:
% x A colum vector with the solution.
ab     = [a,b];
[R, C] = size(ab);
for j  = 1:R % scan along the lines
    % Pivoting section starts
    pvtemp = ab(j,j);
    kpvt   = j;
    % Looking for the row with the largest pivot element.
    for k=j+1:R
        if ab(k,j)~=0 && abs(ab(k,j)) > abs(pvtemp)
            pvtemp = ab(k,j);
            kpvt   = k;
        end
    end
    % If a row with a larger pivot element exists, switch the rows.
    if  kpvt      ~= j
        abTemp     = ab(j,:);
        ab(j,:)    = ab(kpvt,:);
        ab(kpvt,:) = abTemp;
    end
    % Pivoting section ends
    ab(j,:) = ab(j,:)/ab(j,j); % norlamize row with diagonal element
    for i = 1:R
        if i~=j
            ab(i,j:C) = ab(i,j:C)-ab(i,j)*ab(j,j:C);
        end
    end
end
x=ab(:,C); % last column of the matrix ab is the solution x