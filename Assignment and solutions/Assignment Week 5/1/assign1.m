clearvars
close all
clc


xi   = 5.49;
xi1  = 5.58;
xi2  = 5.63;
yi   = 8.08;
yi1  = 8.12;
yi2  = 8.15; 

dy_i = ((xi1-xi)^2*yi2 - (xi2-xi)^2*yi1 - ((xi1-xi)^2-(xi2-xi)^2)*yi)/...
        ((xi1-xi)*(xi2-xi)*((xi1-xi)-(xi2-xi)))