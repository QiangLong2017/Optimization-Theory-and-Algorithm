function [xmin,fmin]=Trust_Region_Method(x0)

eta1=0.01;
eta2=0.75;
gamma1=0.5;
gamma2=2.0;
Delta_bar=3;
Delta0=1;
epsilon=1e-6;
k=0;
xk=x0;
Deltak=Delta0;

while 1
    % stop criteria
    gk=gradient(xk);
    Bk=Hessian(xk);
    if norm(gk)<=epsilon
        xmin=xk;
        fmin=objective_fun(xmin);
        k
        return;
    end

    % solve subproblem
    % Cauchy displacement
    if gk'*Bk*gk<=0
        dk=-(Deltak/norm(gk))*gk;
    else
        dk=-min(norm(gk)^2/(gk'*Bk*gk),Deltak/norm(gk))*gk;
    end
    
    % Dogleg method
%     dku=-((norm(gk)^2)/(gk'*Bk*gk))*gk;
%     dkN=-inv(Bk)*gk;
%     if norm(dku)>=Deltak
%         dk=-(Deltak/norm(gk))*gk;
%     elseif norm(dku)<Deltak && norm(dkN)<=Deltak
%         dk=dkN;
%     else
%         temp1=inf;
%         for tau=0:0.01:1
%             if norm((1-tau)*dku+tau*dkN)-Deltak<temp1
%                 dk=(1-tau)*dku+tau*dkN;
%             end
%         end
%     end
    
    % ratio
    rhok=(objective_fun(xk)-objective_fun(xk+dk))/(mk(zeros(length(xk),1),xk)-mk(dk,xk));
    
    % adjust trust region radius
    if rhok<=eta1
        Deltak=gamma1*Deltak;
    elseif rhok>=eta2 && (norm(dk)<=Deltak+epsilon && norm(dk)>=Deltak-epsilon)
        Deltak=min(gamma2*Deltak,Delta_bar);
    end
    
    % update iteration point
    if rhok>eta1
        xk=xk+dk;
    end
    k=k+1;
end