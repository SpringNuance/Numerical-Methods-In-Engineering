format long
sol=1.454648713;

func = @(x)((cos(x)).^2).*(sqrt(1-(x.^2)));
sum=0;
i=1;
n=164;
tic
timing=toc;

while(i<n)
    q=cos(((2*i-1)*pi)/(2*n));
    sum=sum+func(q);
    i=i+1;
end

answer=((sum*pi)/n);

disp(timing);

romberg(func,-1,1,exp(-10),10)

integral(func,-1,1)

disp(answer);
disp(n);
disp(timing);




