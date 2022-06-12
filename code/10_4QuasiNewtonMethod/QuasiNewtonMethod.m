function [fmin,xmin]=QuasiNewtonMethod(x0)

% initialization
epsilon=1.0e-15;
fmin=inf;
xmin=x0;
xk=x0;
I=eye(length(x0));
Hk=I;
gk=grad_obj(xk);

% iteration
while 1
   % stop criterion   
   if norm(gk)<epsilon
       xmin=xk;
       fmin=obj(xmin);
       break;
   else
       % search direction
       dk=-Hk*gk;
       % step size
       alphak=fminbnd(@(alpha) phi(alpha,xk,dk),0,10);
       % update point
       tempxk=xk;
       xk=xk+alphak*dk;       
       % update Hk
       tempgk=gk;
       gk=grad_obj(xk);
       sk=xk-tempxk;
       yk=gk-tempgk;
       % DFP
       % Hk=Hk+(sk*sk')/(sk'*yk)-(Hk*yk*yk'*Hk)/(yk'*Hk*yk);
       % BFGS
        Hk=(I-(sk*yk')/(sk'*yk))*Hk*(I-(yk*sk')/(sk'*yk))+(sk*sk')/(sk'*yk);
       
   end
end

