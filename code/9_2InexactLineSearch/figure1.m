x=zeros(2,100);
x(1,:)=linspace(-3,3,100);
x(2,:)=linspace(-3,3,100);

[X1,X2]=meshgrid(x(1,:),x(2,:));
Z=zeros(100,100);
for i=1:100
    for j=1:100
        Z(i,j)=obj2([X1(i,j),X2(i,j)]);
    end
end


plot3(X1,X2,Z)
% surf(X1,X2,Z)
% contour(X1,X2,Z)

    
