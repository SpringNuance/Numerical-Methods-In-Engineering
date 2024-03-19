
%I was not able to get the graph that was demonstrated during the exercise
%session. I am not sure where it went wrong but the method at least seems
%right.
clc;
clear;
close all
%setting up the variables
circle_probability = zeros(1, 11);
divide = 1:1:10;
set = 0;

%a loop for finiding the area of the circle
for i = 1:10
    area = pi*divide(i)*divide(i) - set;
    circle_probability(i) = area;
    set = sum(circle_probability);
end
circle_probability(11) = 1 - pi/4;
%setting up the number of targets and shots
targets = zeros(1, 11);
shots = 1000000;
%setting up the circle 
radius = 0.5;
c = 0.5;
d = 0.5;

%a for loop for finding the specific parts of the circle 
for i = 1:shots
    a = rand(1, 1);
    b = rand(1, 1);
    distance = sqrt((a-c)^2 + (b-d)^2);
    
    if (distance <= radius) 
        diameter = distance * 2;
        circle = ceil(diameter * 10);
        targets(circle) = targets(circle) + 1;
    else 
        targets(11) = targets(11) + 1;
    end
    
end


finalprob = targets / shots;
a = linspace(0, 1, 11);

plot(a, circle_probability, 'r-', a, finalprob, 'b-') %plotting the graph
