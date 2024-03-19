function [a, df] = DerivativeRidders(func,x,h,err)
format long
if nargin<4, err= 1e-7; end
con  = 2; 
con2 = con*con;
nTab = 5;
if h == 0, disp('h must be be nonzero'); return, end
hh = h;
a(1,1) = (feval(func,x+hh)-feval(func,x-hh))/(2*hh); 
for i  = 2:nTab
    hh = hh/con;
    a(1,i) = (feval(func,x+hh)-feval(func,x-hh))/(2*hh);
    fac    = con2;
    for j = 2:i
        a(j,i) = (a(j-1,i)*fac-a(j-1,i-1))/(fac-1);
        fac    = con2*fac;
        errt   = max(abs(a(j,i)-a(j-1,i)),abs(a(j,i)-a(j-1,i-1)));
        if errt <= err, err = errt; df=a(j,i); end
    end
end