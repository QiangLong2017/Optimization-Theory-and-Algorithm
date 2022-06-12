function y=grad_obj2(x)

y=zeros(2,1);
y(1)=6*(3*x(1)-4);
y(2)=16*x(2)*(4*x(2)^2-2);