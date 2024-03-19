clearvars
close all
clc
x=input('Please enter a value for x\n'); flag=0;
if x==1, flag=0; end
if x==2, flag=1; end
if x~=1 && x~=2
    for i=2:x-1
        remainder=rem(x,i);
        if remainder==0
            flag=0;
            break
        else
            flag=1;
        end
    end
end
if flag==1
    fprintf('x=%5f is a prime number\n',x);
end
if flag==0
    fprintf('x=%5f is NOT a prime number\n',x);
end