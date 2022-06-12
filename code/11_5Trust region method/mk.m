function y=mk(x,xk)

fk=objective_fun(xk);
gk=gradient(xk);
Bk=Hessian(xk);

y=fk+gk'*x+0.5*x'*Bk*x;