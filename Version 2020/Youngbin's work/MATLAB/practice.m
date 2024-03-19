clear;
clc;
close all

x_min = input('Please set the minimum value of x; x_min=');
x_max = input('Please set the maximum value of x; x_max=');
Deltax=input('Please set dx for plotting; dx=' );

x=[x_min:Deltax:x_max];
n=size(x);
np=n(2);
z_0=zeros(np);

y1=(x./(1-x)).*(sqrt((2.*3.5)./2+x))-0.04;


figure (1); plot(x,y1,'r-',x,z_0,'g-'); %plots the equation of x and y connencting them with a curved line and a horizontal line on the x axis with the 0s
xlabel('x');%name of x axis
ylabel('y=(x/(1-x))*(sqrt((2*3.5)/2+x))-0.04'); % name of y axis
xlim([min(x) max(x)]);%sets the limits of x and y axis
grid on
H=figure(1);
filename='MoleFractionCurve';
savefig(filename);
print(H,'-dtiff',filename);%Prints the figure

figure(1);
plot(x,y1,'r-',x,z_0,'g-');
xlabel('x');
ylabel('y=(x/(1-x))*(sqrt((2*3.5)/(2+x))-0.04');
xlim([min(x), max(x)]);
grid on
H = figure(1);
filename = 'MoleFractionCurve';
savefig(filename);
print(H, '-dtiff', filename);
