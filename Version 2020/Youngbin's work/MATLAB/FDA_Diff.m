

function [df, dff]=FDA_Diff(data)
np=length(data);
if np<5
    disp('The number of data should be equal or greater than 5');
    return;
end 
x=data(:,1);
y=data(:,2);
h=x(2)-x(1);

for i=1:np
    if(i==1)
        a=2; %forward FDA
    elseif(i==np)
        a=3; %backward FDA    
    else
        a=1; %central 
    end
    
    if (a==3) 
       df(i) = (y(i-2) - 4*y(i-1) + 3*y(i)) / (2*h); %first derivative
       dff(i) = (-y(i-3) + 4*y(i-2) - 5*y(i-1) + 2*y(i)) / (h*h); %second derivative
    elseif (m == 2) %forward FDA
       df(i) = (-y(i+2) + 4*y(i+1) - 3*y(i)) / (2*h);
       dff(i) = ((2*y(i)) - (5*y(i+1)) + (4*y(i+2)) - y(i+3)) / (h*h);
    elseif (m == 1) %central  
       df(i) = (y(i+1) - y(i-1)) / (2*h); 
       dff(i) = (y(i+1) - 2*y(i) + y(i-1)) / (h*h);
    end
end