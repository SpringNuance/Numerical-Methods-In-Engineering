function Ih = trapezoid(func,a,b,I2h,k)
% Recursive trapezoidal rule.
% USAGE: Ih = trapezoid(func,a,b,I2h,k)
% func = handle of function being integrated.
% a,b = limits of integration.
% I2h = integral with 2ˆ(k-1) panels.
% Ih = integral with 2ˆk panels.
    if k == 1
        fa = feval(func,a); fb = feval(func,b);
        Ih = (fa + fb)*(b - a)/2.0;
    else
        n = 2^(k -2 ); % Number of new points
        h = (b - a)/n ; % Spacing of new points
        x = a + h/2.0; % Coord. of 1st new point
        sum = 0.0;
        for i = 1:n
        fx = feval(func,x);
        sum = sum + fx;
        x = x + h;
        end
        Ih = (I2h + h*sum)/2.0;
    end
end