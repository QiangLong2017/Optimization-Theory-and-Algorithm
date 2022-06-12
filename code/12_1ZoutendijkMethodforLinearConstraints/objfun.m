function [y,g] = objfun(x)
y = x(1)^2+x(2)^2-2*x(1)-4*x(2)+6;
g = [2*x(1)-2;2*x(2)-4];