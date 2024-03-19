    clear;
    clc;
    close all
    
    x_min=-6;
    x_max=6;
    Deltax=0.01;
    x=[x_min:Deltax:x_max];
    np=length(x);
    z_0=zeros(np);
    y=sin(x).*(cos(x)).^2+1e-4;
    
    plot(x,y,'r-',x,z_0,'k-')
    