function x = Gauss_alt(a,b)
%The function uses gauss elimination to find the column vector 'x'
%Input variables:
%a is the coefficient matrix while b is the column vector on the right
a = [1 2 -2; 2 3 1; 3 2 -4];
b = [9 23 11];
%Elimination method
if size(b,2)> 1; b = b'; end
ab      = [a,b];
[R, C]  = size(ab);

%Elimination phase 
for j=1:(R-1)
    for i=(j+1):R
        ab(i,j:C)= ab(i,j:C)-ab(i,j)/ab(j,j)*ab(j,j:C);
    end
end

%Backward substitution
x=zeros(R,1);
x(R)=ab(R,C)/ab(R,R);
for i= (R-1):-1:1
    x(i)= (ab(i,C)-ab(i,i + 1:R)*x(i + 1:R))/ab(i,i);
end



