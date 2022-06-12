% Cyclic coordinate method for minimizing a function of several variables
% without using any derivative information.
% x0 is a row vector.

function [xmin,fmin]=Cyclic_Coordinate_Method(x0)

epsilon=1e-5;
x_k=x0;
n=length(x0);
D=eye(n);
k=0;

while 1
    % coordinate search
    y_j=x_k;
    for j=1:n
        d_j=D(:,j);
        lambda_j=fminbnd(@(lambda) theta(lambda,y_j,d_j),-10,10);
        y_j=y_j+lambda_j*d_j;
    end
    x_kplus1=y_j;
    
    % stop criteria
    if (norm(x_kplus1-x_k)<epsilon) && (objective_fun(x_k)-objective_fun(x_kplus1)<epsilon)
        xmin=x_kplus1;
        fmin=objective_fun(xmin);
        k
        return;
    end
    
    % iteration
    x_k=x_kplus1;
    k=k+1;
end