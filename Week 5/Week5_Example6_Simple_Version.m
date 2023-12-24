clc;clear;
close all

D=1.0; % diameter
A_Analytical=pi*D^2/4 % exact value of the area of the circle
n_rand_max=100000; % maximum of random numbers we want to use for our problem
xc=0.5;yc=0.5; % coordinates of the center

Count_hitting=0; %Setting a counter for the points hitting teh circle
for i=1:n_rand_max
    x_rand=rand(1,1);
    y_rand=rand(1,1);
    
    Distance=sqrt((x_rand-xc)^2+(y_rand-yc)^2);
    if (Distance <= (D/2))
        Count_hitting=Count_hitting+1;% adding it to the counter
    end
end
Area_Numerical=Count_hitting/n_rand_max

Rel_error=abs((Area_Numerical-A_Analytical)/A_Analytical*100)
        
    