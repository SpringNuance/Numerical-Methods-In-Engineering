function c = TransDecOtherBase(l,b,m)
% The function transforms a decimal fixed number (integer) l to a number 
% with base b by using m digits including the first digit for the sign of 
% the number.
% l - number in decimal base
% b - base
% m - number of storing places including the sign
% c - row array to store the base-b form
c = zeros(1,m); 
j = m;
if l ~= 0
    if l < 0
    c(1) =  1;
    l    = -l;
    end
    while l ~= 0 && j > 1
        c(j) = l-b*fix(l/b); % rem(l,b);
        l    = (l-c(j))/b;
        j    = j-1;
    end
end
if l > 0 % check for overflow
    disp('Overflow occured, increase digits m.')
end