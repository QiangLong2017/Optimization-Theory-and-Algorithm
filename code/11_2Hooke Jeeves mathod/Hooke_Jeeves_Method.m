% Method of Hooke and Jeeves using line search

function [xmin,fmin]=Hooke_Jeeves_Method(x0)

epsilon=1e-5;
x_k=x0;
y=x_k;
k=0;
n=length(x0);
D=eye(n);

while 1
    % exploratory search
    z_j=y;
    for j=1:n
        d_j=D(:,j);
        lambda_j=fminbnd(@(lambda) theta(lambda,z_j,d_j),-10,10);
        z_j=z_j+lambda_j*d_j;
    end
    x_kplus1=z_j;
    
    % stop criteria 
    if (norm(x_kplus1-x_k)<epsilon) && (objective_fun(x_k)-objective_fun(x_kplus1)<epsilon)
        xmin=x_kplus1;
        fmin=objective_fun(xmin);
        k
        return;
    end
    
    % exploratory search
    d_k=x_kplus1-x_k;
    lambda_bar=fminbnd(@(lambda) theta(lambda,x_kplus1,d_k),-10,10);
    y=x_kplus1+lambda_bar*d_k;
    
    % iteration
    x_k=x_kplus1;
    k=k+1;
end