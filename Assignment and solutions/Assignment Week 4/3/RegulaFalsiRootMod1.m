function Xs = RegulaFalsiRootMod1(func,a,b,ErrMax)
% The function finds the root of func=0 using the modified regula falsi
% method
% Input variables:
% func: name of a function file that calculates func for a given x
% a, b: two points that bracket the root
% TolMax: the maximum error
% Output variable: 
% Xs: root
if nargin < 4; ErrMax = 1.0e-4; end
imax=100;
Fa=feval(func,a); ia=0; Fac=Fa; ai=a;
Fb=feval(func,b); ib=0; Fbc=Fb; bi=b;
% Check if points a and b are bracketing the solution
if Fa*Fb>0
    error('Error: Root is not bracketed in (a,b)')
else
    for i=1:imax
        if i>1
            XsIminus1 = Xs;
        end
        % Check if the endpoint a remains the same for three iterations
        if ai==a
            ia=ia+1;
            na=ia/3;
            if rem(ia,3)==0
                Fac = Fa/(2*na);
            end
        else
            ai=a;
            ia=1;
        end
        % Check if the endpoint b remains the same for three iterations
        if bi == b
            ib=ib+1;
            nb=ib/3;
            if rem(ib,3)==0
                Fbc =Fb/(2*nb);
            end
        else
            bi=b;
            ib=1;
        end
        Xs = (a*Fbc-b*Fac)/(Fbc-Fac);
        FXs= feval(func,Xs);
        if FXs==0
            break
        end
        % Check if the estimated relative error is smaller than Errmax
        if i>1 && abs((Xs-XsIminus1)/XsIminus1)<=ErrMax
            break
        end
        % Check if the imax has been reached and exit
        if i == imax
            fprintf('Solution was not obtained in %i iterations',imax)
            break
        end
        % Check which bounds need to be moved
        if Fa*FXs<0
            b=Xs;
            Fb=FXs; Fbc=Fb;
        else
            a=Xs;
            Fa=FXs; Fac=Fa;
        end
    end
end