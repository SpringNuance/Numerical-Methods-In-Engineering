function I = Comptrapez(FunName,a,b)
% Numerically integrates a given function on [a,b] using the composite
% trapezoidal method. The integral is first calculated using two 
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
N=2;
h=(b-a)/N;
x=a:h:b;
y=FunName(x);
I=h/2*(y(1)+y(N+1))+h*sum(y(2:N));
N=2*N;
check=0;
% Calculating subsequent values of I
while check==0
    h=(b-a)/N;
    x=a:h:b;
    y=FunName(x);
    % Composite trapezoidal method
    I_new=h/2*(y(1)+y(N+1))+h*sum(y(2:N));
    % Compare solution with that calculated in the previous iteration
    error=abs(I-I_new)/I*100; % (*)
    if error>1.0 % continue iteration
        check=0;
        N=N*2;
        I=I_new;
    elseif error<=1.0 % end iteration
        check=1;
        I=I_new;
    end
end