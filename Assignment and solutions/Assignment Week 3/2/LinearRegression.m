function [a1,a0] = LinearRegression(x,y)
format long
% LinearRegression calculates the coefficients a1 and a0 of the linear
% equation y = a1*x + a0 that best fits n data points.
% Input variables:
% x A vector with the coordinates x of the data points.
% y A vector with the coordinates y of the data points.
% Output variables:
% a1 The coefficient a1.
% a0 The coefficient a0.
nx=length(x);
ny=length(y);
if nx ~= ny
    disp('ERROR: The number of elements in x must be the same as in y.')
    a1  = 'Error';
    a0  = 'Error';
else
    Sx  = sum(x);
    Sy  = sum(y);
    Sxy = sum(x.*y);
    Sxx = sum(x.^2);
    a1  = (nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
    a0  = (Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);  
end