% Example 3_ Week 5
clc;clear;
close all
format long 

h=input('Please enter the delta x=')
X=0:h:2;
func=@(x) 5*x.^3+2*x.^2-4*x+2;
df1=@(x) 15*x.^2+4*x-4;
df2=@(x) 30*x+4;

np=length(X);
y=feval(func,X);
dy_dx_Analytical=feval(df1,X); % analytical values of the first derivaitive
dyy_dxx_Analytical=feval(df2,X);% analytical values of the second derivaitive

% Numerical calculation of derivative by central difference approximation
% the first order of derivative

for i=2:np-1
    dy_dx_CDA(i-1)=(y(i+1)-y(i-1))/(2*h);
    abs_err_dydx(i-1)=abs(dy_dx_CDA(i-1)-dy_dx_Analytical(i));
    dyy_dxx_CDA(i-1)=(y(i+1)-2*y(i)+y(i-1))/(h^2);
    abs_err_dyydxx(i-1)=abs(dyy_dxx_CDA(i-1)-dyy_dxx_Analytical(i));
    
    XX(i-1)=X(i);
end

fprintf('\n=====================================');
fprintf('\n Absolute Errors in dy/dx');
fprintf('\n %s\t %f', 'Mean value =',mean(abs_err_dydx));
fprintf('\n %s\t %f', 'Min value =',min(abs_err_dydx));
fprintf('\n %s\t %f\n', 'Max value =',max(abs_err_dydx));
fprintf('\n=====================================');
fprintf('\n Absolute Error [percent] in dyy/dxx');
fprintf('\n %s\t %f', 'Mean value =',mean(abs_err_dyydxx));
fprintf('\n %s\t %f', 'Min value =',min(abs_err_dyydxx));
fprintf('\n %s\t %f\n', 'Max value =',max(abs_err_dyydxx));

figure(1); plot(X,dy_dx_Analytical,'-',XX,dy_dx_CDA,'r.');
figure(2); plot(X,dyy_dxx_Analytical,'-',XX,dyy_dxx_CDA,'r.');
