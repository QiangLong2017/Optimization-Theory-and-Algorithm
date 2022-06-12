xk=[0;0];
dk=-grad_obj2(xk);

y=fminbnd(@(alpha) phi(alpha,xk,dk),0,5);