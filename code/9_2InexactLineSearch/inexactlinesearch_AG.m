function y=inexactlinesearch_AG(alpha0,xk,dk)

pho=0.3;

alpha=alpha0;
fxk=obj2(xk);
gradfxk=grad_obj2(xk);
while 1
    fxkplus1=phi(alpha,xk,dk);
    if (fxkplus1<=fxk+pho*gradfxk'*dk*alpha)...
            &&(fxkplus1>=fxk+(1-pho)*gradfxk'*dk*alpha);
        y=alpha;
        break;
    elseif fxkplus1>fxk+pho*gradfxk'*dk*alpha
        alpha=0.5*alpha;
    elseif fxkplus1<fxk+(1-pho)*gradfxk'*dk*alpha
        alpha=2*alpha;
    end
end