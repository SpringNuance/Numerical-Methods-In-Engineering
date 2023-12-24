function x = RegulaFalsiRootMod1(func, a, b, err)
    format long
    imax = 100;
    if nargin < 4
        err = 0.0001;
    end
    
    tol = inf;
    x_previous = 0;
    i = -1; %normalised for program structure
    num_a = 0;
    num_b = 0;
    while (tol > err)
        prev_x = x_previous;
        prev_a = a;
        prev_b = b;
        fa = feval(func, a);
        fb = feval(func, b);
        if num_a == 3
            fa = fa / 2;
            num_a = 1;
        elseif num_b == 3
            fb = fb / 2;
            num_b = 1;
        end
        x_previous = (a*fb - b*fa) / (fb - fa);
        if fa*feval(func, x_previous) < 0
            b = x_previous;
        else
            a = x_previous;
        end
        x_previous = (a*fb - b*fa) / (fb - fa);
        tol = abs((x_previous - prev_x)/prev_x);
        i = i + 1;

        if a == prev_a
            num_a = num_a + 1;
            num_b = 1;
        elseif b == prev_b
            num_b = num_b + 1;
            num_a = 1;
        end
        if i == imax
            printf("%s %d %s", "The program didn't derive the solution within ", imax, "iterations.");
            break;
        end
    end
    if i ~= imax
       x = x_previous;
    end 
end

