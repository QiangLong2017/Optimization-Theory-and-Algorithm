function [y,g] = objFun(x)
y = (1/12)*(x(1)+1)^3+x(2);
g = [(1/4)*(x(1)+1)^2;1];