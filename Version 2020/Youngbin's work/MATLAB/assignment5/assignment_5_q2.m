

function [df, dff]=FDA_Diff(data)
np=length(data);
if np<5
    disp('The number of data should be equal or greater than 5');
    return;
end 
x=data(:,1);
y=data(:,2);
h=x(2)-x(1);
%for i=2:np-1
%    dy_dx_CDA(i-1)=(y(i+1)-y(i-1))/(2*h);
%    dyy_dxx_CDA(i-1)=(y(i+1)-2*y(i)+y(i-1))/(h^2);
%end
for i=1:np
    if(i==1)
        df(i)=;
        dff(i)=;
    elseif(i==np)
        df(i)=;
        dff(i)=;
    else
        df(i)=;
        dff(i)=;
    end
end 