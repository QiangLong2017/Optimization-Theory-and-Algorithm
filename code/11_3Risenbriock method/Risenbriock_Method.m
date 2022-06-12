%Method of Rosenbriock using line searches

function [xmin,fmin]=Risenbriock_Method(x0)

epsilon=1e-5;
x_k=x0;
k=0;
n=length(x0);
D=eye(n);
Lambda=zeros(n,1);

while 1
    % orthogonal search
    z_j=x_k;
    for j=1:n
        d_j=D(:,j);    
        lambda_j=fminbnd(@(lambda) theta(lambda,z_j,d_j),-10,10);
        Lambda(j)=lambda_j;
        z_j=z_j+lambda_j*d_j;
    end
    x_kplus1=z_j;
    
    % stop criteria
    if (norm(x_kplus1-x_k)<epsilon) && (objective_fun(x_kplus1)-objective_fun(x_k)<epsilon)
        xmin=x_kplus1;
        fmin=objective_fun(xmin);
        k
        return;
    end
    
    % Gram-Schmidt procedure
    D=Gram_Schmidt_Procedure(D,Lambda);
    
    % iteration
    x_k=x_kplus1;
    k=k+1;
end

        