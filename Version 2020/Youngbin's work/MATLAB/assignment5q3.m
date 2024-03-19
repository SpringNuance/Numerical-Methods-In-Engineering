clear;
clc;
close all

%step1: find the exact solution
d=1.0;
A_square=d^2;
n_circle=10; %number of circles

for i=1:n_circle
    R_circle(i)=(i-1)*(d/2)/n_circle+(d/2)/n_circle;
    A_circle(i)=pi*R_circle(i)^2;
    if(i==1)
        A_ring(i)=A_circle(i);
    else
        A_ring(i)=A_circle(i)-A_circle(i-1);
    end
    Prob_Analytical(i)=A_ring(i)/A_square;
end 
Prob_Missing_Analytical=(A_square-A_circle(n_circle))/A_square;
Sum_Prob_Analytical=sum(Prob_Analytical)+Prob_Missing_Analytical;

for i_rand_max=1000:1000:1000000;
    [Prob_Rings_Statistical,Prob_missed_Statisitical,Mean_err]=Statistical(i_rand_max, R_circle,Prob_Analytical);
    n_rand_max(i_rand_max)=i_rand_Max;
    mean_error(i_rand_max)=Mean_err;
end 