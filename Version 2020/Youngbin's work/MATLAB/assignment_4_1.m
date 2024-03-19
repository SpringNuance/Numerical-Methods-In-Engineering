clearvars
clc;
close all

x=0:0.4:6;
y=[0 3.0 4.5 5.8 5.9 5.8 6.2 7.4 9.6 15.6 20.7 26.7 31.1 35.6 39.3 41.5];
n=length(x);
[a,E]=CubPolFit(x,y);
xx=linspace(x(1),x(n),50);
yy=a(4).*xx.^3+a(3).*xx.^2+a(2).*xx+a(1);
plot(x,y,'o',xx,yy);
xlabel('Strain \epsilon'); 
ylabel('Stress \sigma (MPa)');
legend('Data','Polynomial fit');