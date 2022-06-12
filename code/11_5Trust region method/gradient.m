function y=gradient(x)

y=zeros(length(x),1);
y(1)=4*(x(1)-2)^3+2*(x(1)-2*x(2));
y(2)=-4*(x(1)-2*x(2));