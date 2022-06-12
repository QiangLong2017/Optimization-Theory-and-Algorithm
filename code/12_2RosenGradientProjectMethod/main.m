f = @(x) objfun(x);
A = [-1 -1;-1 -5;1 0;0 1];
b = [-2;-5;0;0];
E = [];
e = [];

[xstar,ystar] = rosen(f,A,b,E,e)