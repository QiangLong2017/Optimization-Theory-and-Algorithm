function y=grad_obj(x)

global counter
counter=counter+1;

y=[8*x(1)-2*x(1)*x(2);2*x(2)-x(1)^2];