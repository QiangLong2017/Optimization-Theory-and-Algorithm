alpha0=10;
xk=[0;0];
dk=-grad_obj2(xk);
y=inexactlinesearch_AG(alpha0,xk,dk)

y=inexactlinesearch_WP(alpha0,xk,dk)

