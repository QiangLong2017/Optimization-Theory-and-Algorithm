function [y,g] = objFun(x)
y = (x(1)-1)^2+x(2)^2;
g = [2*(x(1)-1);2*x(2)];