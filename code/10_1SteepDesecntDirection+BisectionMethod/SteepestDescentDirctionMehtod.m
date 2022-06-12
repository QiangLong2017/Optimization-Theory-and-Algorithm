function [fstar, xstar] = SteepestDescentDirctionMehtod(x0)
% parameters
epsilon = 1e-4;
xk = x0;

% stop checking
Dk = [];
while 1
    gk = objfun_grad(xk);
    Dk =[Dk -gk];
    if norm(gk) <= epsilon
        fstar = objfun(xk);
        xstar = xk;
        plot(Dk(1,:),Dk(2,:))
        return;
    else
        dk = -gk; % search direction
        alphak = Bisection(xk,dk,0,2); % line search for step size
        xk = xk+alphak*dk;
    end
end
        
    