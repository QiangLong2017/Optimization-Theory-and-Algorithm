function D=Gram_Schmidt_Procedure(D,lambda)

n=length(lambda);
A=zeros(n);
B=zeros(n);
sum=zeros(n,1);

for j=1:n
    if abs(lambda(j))<=0.0001
        A(:,j)=D(:,j);
    else
        for i=j:n
            A(:,j)=A(:,j)+lambda(i)*D(:,i);
        end
    end
end
for j=1:n
    if j==1
        B(:,j)=A(:,j);
        D(:,j)=B(:,j)/norm(B(:,j));
    else
        for i=1:j-1
            sum=sum+(A(:,j)'*D(:,i))*D(:,i);
        end
        B(:,j)=A(:,j)-sum;
        D(:,j)=B(:,j)/norm(B(:,j));
    end
end        