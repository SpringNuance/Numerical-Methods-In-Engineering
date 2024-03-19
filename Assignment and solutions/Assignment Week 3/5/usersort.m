function xo = usersort(x)
% The function sorts elements of array x in ascending order
n = length(x); % number of data
k = n-1;       % number of x pairs to be compared
l = 0;         % switch, = 0 sort is incomplete, = 1 sort complete

while l==0
    l = 1; 
    for j = 1:k
        if  x(j)  > x(j+1)
            xtemp = x(j);
            x(j)  = x(j+1);
            x(j+1)= xtemp;
            l     = 0;
        end
    end
    k = k-1;
end
xo = x;