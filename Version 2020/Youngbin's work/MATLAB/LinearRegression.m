function [a1,a0] = LinearRegression(x,y)
format long
nx=length(x);
ny=length(y);

if nx~=ny
    disp('Error')
else
   Sx=sum(x);
   Sy=sum(y);
   Sxy=sum(x.*y);
   Sxx=sum(x.^2);
   a1 = (nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
   a0 = (Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);
end