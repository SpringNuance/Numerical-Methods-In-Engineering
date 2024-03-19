clear;
clc;
close all

%function [S, E, M] = binaryFloatingNumber(y, p)
% I tried to use the function above but for some reason, I was having
% errors so it did not work. 
y = input('Enter a number: ');
S = 0;
E = 0;
M = 0;
if -2^100<y && y<2^100
        %checks the number of inputs
        %if nargin == 1
        %    p = sp;
        %end
        %I could not leave this uncommented since the code did not run
        %properly with it. 
        %checks the symbol
        %returns 0 if positive, 1 if negative. 
        if y>0
            S = 0;
        elseif y<0
            S = 1;
        end
        %checks the exponent
        %I tried adding the strings 0s and 1s to the exponent but I did not
        %know how this code should be fixed from here. 
        while mod(y-1,2^E)==0
            E=E+1;
        end
        remainder = E;
        for i = (E+127)/2:1
            if rem(i,2) == 0
                remainder = remainder + '0';
            elseif rem(i,2) ~= 0
                remainder = remainder + '1';
            end  
        end
        
        % checks the Mantissa
        % Likewise, I tried adding 0s and 1s as string to the mantissa but
        % could not fix the code any more from here. 

        %if p == sp
        for n = 1:23
            if n*2 < 1
                M = M + '0';
            elseif n*2 >= 1
                M = M + '1';
            end
        
            %if p == 2
                %for n = 1:52
                    %if n / 2 == 1
                        %m_numbers = m_numbers + '0';
                    %elseif n / 2 == 0
                        %m_numbers = m_numbers + '1';
                 %end
             %end
        end
%returns three numbers: Symbol, Exponent, and the Mantissa
final = [S,E,M];
disp(final)        
else
    fprintf('Error: Number is out of range')
end