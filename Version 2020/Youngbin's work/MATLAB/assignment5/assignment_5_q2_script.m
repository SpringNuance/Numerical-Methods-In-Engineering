clc;
clear;
close all
data = importdata("Assigment_2_Week5_xy_Data.txt"); %importing data


x=data(:,1);
y=data(:,2);

% I ran the code but couldn't find the reason why the code wasn't running
% properly. I think I have the right methods but can't seem to find the
% critical error. I had the text file and the code in the same file. 
[df,dff] = FDA_Diff(data);
