xk=[0,0]';
dk=-grad_obj2(xk);
alpha=linspace(0,0.1,50);
phi_alpha=zeros(1,50);
for i=1:50
    phi_alpha(i)=phi(alpha(i),xk,dk);
end

plot(alpha,phi_alpha);