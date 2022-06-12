function y=Hessian(x)

y=zeros(length(x));

y=[12*(x(1)-2)^2+2*x(1) -4; -4 8];