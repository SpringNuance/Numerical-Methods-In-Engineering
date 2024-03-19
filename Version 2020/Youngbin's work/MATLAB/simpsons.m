clc;
clear;
close all

data1 = dlmread('Data_set1.txt','',3,0);
data11 = SimpsonsRule(data1);
disp(data11)
data2 = dlmread('Data_set2.txt','',3,0);
data22 = SimpsonsRule(data2);
disp(data22)


function I = SimpsonsRule(data)
np=length(data);
x=data(:,1);
y=data(:,2);
I=0;
h=x(2)-x(1);
if mod(np,2)~=0
    I = ((y(1)+y(end))+4*sum(y(2:2:end-1))+2*sum(y(3:2:end-2)))*(h/3);
else
    I1=(y(1)+3*y(2)+3*y(3)+y(4))*(3*h/8);
    finaly=y(5:end);
    I2=((finaly(1)+finaly(end))+4*sum(finaly(2:2:end-1))+2*sum(finaly(3:2:end-2)))*(h/3);
    I=I1+I2;
end
end


