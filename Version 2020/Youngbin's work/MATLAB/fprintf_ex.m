clearvars
close all
clc

x=0:0.5:1;
for i = 1:length(x)
fprintf('%1.1e %1.6f\n',x(i), sin(x(i)))
end