function y=grad_obj(x)

global counter
counter=counter+1;

y=[(2/3)*x(1);x(2)];