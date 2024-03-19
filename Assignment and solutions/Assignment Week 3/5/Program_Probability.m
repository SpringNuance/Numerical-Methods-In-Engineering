clear all
close all
clc

load data.txt

x     = data;         % data
n     = length(x);    % number of data
xo    = usersort(x);  % sort data
[f,X] = GroupData(x); % Grouping data
[A,s] = MeanStD(x);   % Mean and standard deviation
g     = exp(-((xo-A)/s).^2/2)/(s*sqrt(2*pi)); % Gaussian distribution

figure(1)
bar(X,f)
xlabel('X')
ylabel('f')
box on

figure(2)
bar(X,f/n)
hold on 
scatter(xo,g,"filled")
box on
xlabel('x_o')
ylabel('g(x_o)')

P_174      = cdf('normal',174,A,s)
P_182_174  = cdf('normal',182,A,s)  -cdf('normal',178,A,s)
P_1std     = cdf('normal',A+s,A,s)  -cdf('normal',A-s,A,s)
P_2std     = cdf('normal',A+2*s,A,s)-cdf('normal',A-2*s,A,s)
P_3std     = cdf('normal',A+3*s,A,s)-cdf('normal',A-3*s,A,s)
