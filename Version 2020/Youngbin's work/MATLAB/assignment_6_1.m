clc;
clear;
close all
format long

%The code takes in the function 
func = @(x) ((sin(x))^2-tan(x));
I2h = 0; 
%It uses the trapezoid rule to calculate 
for k = 1:50
    Ih = trapezoid(func,0,pi/4,I2h,k);\
    if (k > 1 && abs(Ih - I2h) < 1.0e-3)
        checked = 2^(k-1) + 1;
        return 
    end
    I2h = Ih; 
end
