clearvars
close all
clc
%Defining the matrix 
A= [ 10 1  0   0  0 0 0 0 0 0 0; 
     25 1  0   0  0 0 0 0 0 0 0; 
     0 0 25^2 25 1 0 0 0 0 0 0;
     0 0 40^2 40 1 0 0 0 0 0 0; 
     0 0 0 0 0 40^2 40 1 0 0 0; 
     0 0 0 0 0 55^2 55 1 0 0 0;
     0 0 0 0 0 0 0 0 55^2 55 1; 
     0 0 0 0 0 0 0 0 70^2 70 1; 
     -1 0 -30 1  0 0 0 0 0 0 0; 
     0 0 -80 -1 0 80 1 0 0 0 0; 
     0 0 0 0 0 -110 -1 0 110 1 0];
B     = [12; 26; 26; 28; 28; 30; 30; 24; 0; 0; 0];
coeff = (A\B)';

%setting the variables also know as x in Ax=b
b1 = coeff(1);
c1 = coeff(2);
a2 = coeff(3);
b2 = coeff(4);
c2 = coeff(5);
a3 = coeff(6);
b3 = coeff(7);
c3 = coeff(8);
a4 = coeff(9);
b4 = coeff(10);
c4 = coeff(11);

%setting the conditions
x = [10 25 40 55 70]; 
y = [12 26 28 30 24];
st=0.5;
x1=(10:st:25);
x2=(25:st:40);
x3=(40:st:55);
x4=(55:st:70);

%giving the graph functions
f1=b1*x1+c1;
f2=a2*x2.^2+b2*x2+c2;
f3=a3*x3.^2+b3*x3+c3;
f4=a4*x4.^2+b4*x4+c4;

%plotting the graph
figure(1)
hold on
plot(x1,f1,'k',x2,f2,'k',x3,f3,'k',x4,f4,'k',x,y,'*r')
box on
xlabel('x')
ylabel('y')