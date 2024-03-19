clear;
clc;
close all
syms x y z

f1 = x^2*y*x + y^2*z - 3*z^4;
f2 = x - (1/y) + z^3*x;
f3 = y*x + y*z + x*z;
%f = [f1;f2;f3];

Jac(1,1)=diff(f1,x);
Jac(1,2)=diff(f1,y);
Jac(1,3)=diff(f1,z);
Jac(2,1)=diff(f2,x);
Jac(2,2)=diff(f2,y);
Jac(2,3)=diff(f2,z);
Jac(3,1)=diff(f3,x);
Jac(3,2)=diff(f3,y);
Jac(3,3)=diff(f3,z);

%n = length(f);
%for k=1:n
%    Jac(k,1)=diff(f(k),x);
%    Jac(k,2)=diff(f(k),y);
%   Jac(k,3)=diff(f(k),z);
%end
%Jac_mat=Jac(f,k);
J_mat=[Jac(1,1) Jac(1,2) Jac(1,3); Jac(2,1) Jac(2,2) Jac(2,3); Jac(3,1) Jac(3,2) Jac(3,3)];
