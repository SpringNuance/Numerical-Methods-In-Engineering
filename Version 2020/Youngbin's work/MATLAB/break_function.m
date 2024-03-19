clearvars
close all
clc

limit = 10;
s = 0;
while true  % loops forever, equal to 'while 1'
tmp = rand; % random number
if s > limit
    break
end
s = s + tmp;
end