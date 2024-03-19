function [S,E,M] = binary_float_number_f(y,p)
% y is a number
% p is 1 for simple and 2 for double precision
% S=sign of number, E=exponent and M=mantissa in binary floating type
format long
if nargin==1, p = 1; end
max = 100;
if abs(y)>=2^max || abs(y)<=2^-max, error('Number is out of range'), end
%% Define exponent --------------------------------------------------------
for i = -max:max-1
    if 2^i<=abs(y) && 2^(i+1)>abs(y)
        e = i;
    end
end
%% Mantissa ---------------------------------------------------------------
m = (abs(y)/2^e - 1); %mant = m;
if p==1, bias=127; mb=23; eb=8;  elseif p==2,bias=1023; mb=52; eb=11; end
ex = e+bias;
mbit = zeros(1,mb);
for j = 1:mb
   m = 2*m;
   if     m>1
       mbit(j)= 1;
       m = m-1;
   elseif m==1
       mbit(j)= 1;
       break
   end
end
%% Exponent ---------------------------------------------------------------
ebit    = zeros(1,eb);
for g = 1:eb
    r  = rem(ex,2);
    ex = (ex-r)/2;
    if r==0
       ebit(eb+1-g) = 0;
       if ex==0,   break,  end
    elseif r==1
        ebit(eb+1-g) = 1;
        if ex==0,   break,  end
    end
end
%% Sign -------------------------------------------------------------------
if  sign(y)>=0
    sbit = 0;
elseif sign(y)<0
    sbit = 1;
end
%% Binary floating number -------------------------------------------------
S = sbit;
E = ebit;
M = mbit;