function I = Simp38(FunName,a,b)
% Numerically integrates a given function on [a,b] using the composite
% Simpson's 3/8 method. The integral is first calculated using three
% subintervals. Then, the process is iterated, doubling the N each time,
% until the difference of I between successive iterations is <1%.
% Input variables:
% FunName The function to be integrated (exists separately as a function
% file)
% a Lower limit of integration
% b Upper limit of integration
% Output variables:
% I Value of integral
% Calculating the first value of I
N=3;
h=(b-a)/N;
x=a:h:b;
y=FunName(x);
I=3*h/8*(y(1)+2*sum(y(4:3:(N-2)))+y(N+1));
N=2*N;
check=0;
% Calculating subsequent values of I
while check==0
    h=(b-a)/N;
    x=a:h:b;
    y=FunName(x);
    % Composite Simpson's 3/8 method
    I_new=3*h/8*(y(1)+2*sum(y(4:3:(N-2)))+y(N+1));
    I_new=I_new+3*h/8*3*(sum(y(2:3:(N-1)))+sum(y(3:3:N)));
    % Compare solution with that calculated in the previous iteration
    error=abs(I-I_new)/I*100; 
    if error>1.0 % continue iteration
        check=0;
        N=N*2;
        I=I_new;
    elseif error<=1.0 % end iteration
        check=1;
        I=I_new;
    end
end