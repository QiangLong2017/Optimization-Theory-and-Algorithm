function Fibo=P2_fibonacci(n)

Fibo=zeros(n,1);

Fibo(1)=1;
Fibo(2)=1;

for i=3:n
    Fibo(i)=Fibo(i-1)+Fibo(i-2);
end

