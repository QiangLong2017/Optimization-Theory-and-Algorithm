function [fmin,xmin]=SteepestDesDirMethod(x0)

% initialization
epsilon=1.0e-15;
fmin=inf;
xmin=x0;
xk=x0;

% iteration
while 1
   % stop criterion
   gk=grad_obj(xk);
   if norm(gk)<epsilon
       xmin=xk;
       fmin=obj(xmin);
       break;
   else
       % search direction
       dk=-gk;
       % step size
       alphak=fminbnd(@(alpha) phi(alpha,xk,dk),0,10);
       % update point
       xk=xk+alphak*dk;       
   end
end

