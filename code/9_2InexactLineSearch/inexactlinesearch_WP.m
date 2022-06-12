function y=inexactlinesearch_WP(alpha0,xk,dk)

pho=0.3;
sigma=0.6;

alpha=alpha0;
fxk=obj2(xk);
gradfxk=grad_obj2(xk);
while 1
    fxkplus1=phi(alpha,xk,dk);
    gradxkplus1=grad_obj2(xk+alpha*dk);
    if (fxkplus1<=fxk+pho*gradfxk'*dk*alpha)...
            &&(gradxkplus1'*dk>=sigma*gradfxk'*dk);
        y=alpha;
        break;
    elseif fxkplus1>fxk+pho*gradfxk'*dk*alpha
        alpha=0.5*alpha;
    elseif gradxkplus1'*dk<sigma*gradfxk'*dk
        alpha=2*alpha;
    end
end