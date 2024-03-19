clc;
clear;
close all
format long
%setting up the function 
func = @(x)(tanh(x)).^2.*(sqrt(1-(x.^2)));
sum=0;
i=1;
n=100;
tic
time=toc;
%a while loop for getting the correct value of n for the given precision
while(i<n)
    G=tanh(((2*i-1)*pi)/(2*n));
    sum=sum+func(G);
    i=i+1;
end
answer=((sum*pi)/n);
%using romberg and the integral function to get the computational time
romberg(func,-1,1,exp(-6),6)
integral(func,-1,1)

disp(answer);
disp(n);
disp(time);




