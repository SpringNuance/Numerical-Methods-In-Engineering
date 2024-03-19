function [a,Er] = CubPolFit(x, y)
% CubicPolyFit calculates the coefficients a3,a2,a1 and a0 of the cubic
% polynomial that best fits n data points.
% Input variables:
% x - A vector with the coordinates x of the data points.
% y - A vector with the coordinates y of the data points.
% Output variables:
% a A vector with the values of a3,a2,a1 and a0
% Er The overall error
% The vector [a] is determined by solving the system [X][a]=[Y]
nx = length(x);
ny = length(y);
m  = 4; %number of coefficients
if nx~=ny
    disp('ERROR: The number of elements in x must be the same as in y.')
    a = 'Error';
else
    xsum = zeros((2*m-2),1);
    for i = 1:(2*m-2)
        xsum(i) = sum(x.^(i));
    end
    % First row of matrix [X] and first element of column vector [Y]
    X(1,1) = nx;
    Y(1,1) = sum(y);
    % Remaining rows of [X] and [Y]
    for i = 2:m
        for j = 1:m
            X(i,j) = xsum(j + i - 2);
        end
        Y(i,1) = sum(x.^(i-1).*y);
        X(1,i) = xsum(i-1);
    end
    % Solve for [a] and Er
    a = (X\Y)';
    Er=sum((y-a(4).*x.^3-a(3).*x.^2-a(2).*x-a(1)).^2);
end