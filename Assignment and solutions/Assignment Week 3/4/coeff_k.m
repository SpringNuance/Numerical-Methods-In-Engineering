function [k1,k2] = coeff_k(i)
global k N

if i==1 
    k1=0;
    k2=k(i);
elseif i+1==N
    k1=k(i-1);
    k2=0;
else
    k1=k(i-1);
    k2=k(i);
end