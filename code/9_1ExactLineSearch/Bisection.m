function [xstar,fstar]=Bisection(a0,b0)

global counterf
counterf=0;

% initialization
epsilon=0.00001;
L=1e-4;

ak=a0;
bk=b0;

% iteration
while 1
    % stop criteria
    len=bk-ak;
    if len<L
        xstar=(ak+bk)/2;
        fstar=obj1(xstar);
        break;
    end
        
    mean=(ak+bk)/2;
    lambdak=mean-epsilon;
    muk=mean+epsilon;
    %compute two points every iteration
    flambdak=obj1(lambdak);
    fmuk=obj1(muk);
    
    if flambdak>fmuk
        ak=lambdak;
    else
        bk=muk;
    end    
end

counterf