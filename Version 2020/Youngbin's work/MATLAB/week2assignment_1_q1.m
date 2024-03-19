clear;
clc;
close all

x_min = input('Please set the minimum value of x; x_min='); %asks for the minimum value of x
x_max = input('Please set the maximum value of x; x_max='); %asks for the maximum value of x
Deltax=input('Please set dx for plotting; dx=' ); %asks for the interval of x

x=[x_min:Deltax:x_max]; %sets x values from all minimum of x to maximum of x
np=length(x);
z_0=zeros(np,1); %creats a zeros matrix 

y1=(x./(1-x)).*(sqrt((2.*3.5)./2+x))-0.04; % this is the function 

figure(1);
plot(x,y1,'r-',x,z_0,'g-'); %plots the function 
xlabel('x');
ylabel('y=(x/(1-x))*(sqrt((2*3.5)/(2+x))-0.04');
xlim([min(x), max(x)]); % sets the limits of both x and y axis. 
grid on
H = figure(1);
filename = 'MoleFractionGraph';
savefig(filename);
print(H, '-dtiff', filename); % the graph is printed

figure(2);
plot(x,y1,'b-',x,z_0,'r-'); %plots the function 
xlabel('x');
ylabel('y=(x/(1-x))*(sqrt((2*3.5)/(2+x))-0.04');
xlim([0 0.1]);  % sets the limit of the x axis.
ylim([-0.01 0.01]); %sets the limit of the y aixs. 
grid on
F = figure(2); 
filename = 'FunctionIntersectionPoint';
savefig(filename);
print(F, '-dtiff', filename); % the graph is printed
