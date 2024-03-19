fun=@cos;
c=[1 2];
fun2=@(x) fun1(x,c);
x0=0.1;
x=fzero(fun2,x0);