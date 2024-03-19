function [xv,it] = NewtonManyVariables(x,f,jf,tol)
% Newton's method for solving a system of n nonlinear equations
% in n variables.

if nargin<4; tol=1e-5; end
it = 0; xv = x;
fr = feval(f,xv);
while norm(fr) > tol
    Jr = feval(jf,xv);   xv = xv-Jr\fr;
    fr = feval(f,xv);    it = it+1;
end