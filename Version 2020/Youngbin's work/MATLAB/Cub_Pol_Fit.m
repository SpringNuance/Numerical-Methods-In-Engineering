clear;
clc;
close all

function [a,Er] = CubPolFit(x,y)

nx = length(x);
ny = length(y);
m = 4;
if nx~=ny
    disp('Error: you do not have the same number of x and y')
    a = 'Error';
else 
    xsum = zeros((2*m-2),1);
    for i = 1:(2*m-2)
        xsum(i) = sum(x.^(i));
    end
    
    X(1,1) = nx;
    Y(1,1) = sum(y);
    
    for i = 2:m
        for j = 1:m
            X(i,j) = xsum(j + i - 2);
        end
        Y(i,1) = sum(x.^(i-1).*y);
        X(1,i) = xsum(i=1);
    end
end 
end