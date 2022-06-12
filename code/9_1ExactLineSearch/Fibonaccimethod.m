function [xmin,fmin]=Fibonaccimethod(a,b)

global counterf
counterf=0;

% set parameters
L=1e-4;
temp1=(b-a)/L;

% input Fibonacci sequence
k=3;
while 1
    Fibo=P2_fibonacci(k+1);
    if Fibo(k)>=temp1;
        break;
    end
    k=k+1;
end
n=k+1;

ak=a;
bk=b;
 for k=1:n-2
    % check stop criterion
%     lengths=(bk-ak)/2;
%     if lengths<L
%         xmin=meanp;
%         fmin=P2_phi(xmin);
%         break;
%     end
    
    % iteration    
    lengths=bk-ak;
    lambdak=ak+(Fibo(n-k-1)/Fibo(n-k+1))*lengths;
    muk=ak+(Fibo(n-k)/Fibo(n-k+1))*lengths;
    flambdak=obj1(lambdak);
    fmuk=obj1(muk);
    if flambdak<fmuk
        bk=muk;
    else
        ak=lambdak;
    end
 end

xmin=(ak+bk)/2;
fmin=obj1(xmin);
counterf
