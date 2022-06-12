function y=theta(lambda,y_j,d_j)

x=y_j+lambda*d_j;
y=objective_fun(x);