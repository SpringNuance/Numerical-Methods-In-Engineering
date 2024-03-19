clearvars
close all
clc

p=1000; 
years=0;
while p < 10000
years = years+1;
p = p*(1+0.05);
end