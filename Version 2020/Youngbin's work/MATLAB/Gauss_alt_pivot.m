function x = Gauss_alt_pivot(a,b)
%The function uses gauss elimination to find the column vector 'x'
%Input variables:
%a is the coefficient matrix while b is the column vector on the right
%theta here is set the 45degrees (or pi/4)
a = [1 cos(pi/4) 0 0 1 0; 0 sin(pi/4) 0 1 0 0; 1 0 cos(pi/4) 0 0 0; 0 0 sin(pi/4) 0 0 1; 0 -cos(pi/4) cos(pi/4) 0 0 0; 0 -sin(pi/4) -sin(pi/4) 0 0 0];
b = [0 0 0 0 0 10]';

if size(b,2)> 1; b = b'; end
ab      = [a,b];
[R, C]  = size(ab);

%Elimination phase 
for j=1:(R-1)
    %pivoting condition
    if ab(j,j)==0
        for k = (j+1):R
            if ab(k,j) ~= 0
                abTemp  = ab(j,:);
                ab(j,:) = ab(k,:);
                ab(k,:) = abTemp;
                break
            end
        end
    end
    %for loop for changing the matrix 
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


