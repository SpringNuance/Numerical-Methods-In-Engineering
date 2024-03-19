clear;
clc;
close all


% asks the user to set a value for x 
question = input('Assign a value for x: ');
determine = 0;  
if question <= 1
    fprintf('It is not a prime number')

else 
    for number = 2:question/2
        if mod(question,number) == 0
            fprintf('It is not a prime number')
            determine = 1;
        end 
    end
end
if determine==0
    fprintf('It is a prime number')
end 

        
