f = @(x) objfun(x);
A = [-2 1;-1 -1;1 0;0 1];
b = [-1;-2;0;0];
E = [];
e = [];

[xstar,ystar] = zoutendijk(f,A,b,E,e)