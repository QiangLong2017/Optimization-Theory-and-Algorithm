function y = Bisection(xk,dk,ak,bk)

% parameters 
epsilon = 1e-1;
eta = 0.001;

% main program
while 1
    if bk-ak <= epsilon
        y = (bk+ak)/2;
        return;
    else
        mid = (bk+ak)/2;
        lambdak = mid-eta;
        muk = mid+eta;
        flambdak = phi(xk,dk,lambdak);
        fmuk = phi(xk,dk,muk);
        if flambdak > fmuk
            ak = lambdak;
        else 
            bk = muk;
        end
    end
end

            