clear;
clc;
close all

x = input("enter number: ");
exponent=0;
no1=0;
no2=0;7
vecc=zeros(1,23);
vecval=1;
if x>0
    vecc(vecval)=0;
    vecval=vecval+1;
else
    vecc(vecval)=1;
    vecval=vecval+1;
end
for number=-100:100
    if (2^number)<x && x<(2^(number+1))
        no1=number;
        exponent=number;
    end
end
no1=x/(2^no1);
disp(no1);
mantissa=(no1-1)*2;
disp(mantissa);
while mantissa ~= 1
    if mantissa>1
        vecc(vecval)=1;
        mantissa=(mantissa-1)*2;
        vecval=vecval+1;
        disp(mantissa);
    else
        vecc(vecval)=0;
        mantissa=mantissa*2;
        vecval=vecval+1;
        disp(mantissa);
    end
end
vecc(vecval)=1;
vecval=vecval+1;
no2=(exponent+127)/2;
while no2<1    
    if floor(no2)==ceil(no2)
        vecc(vecval)=0;
        no2=no2/2;
        vecval=vecval+1;
    else
        vecc(vecval)=1;
        no2=floor(no2);
        vecval=vecval+1;
    end
    
end
disp(vecc)
