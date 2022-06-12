function [fmin,xmin]=ConjugateGradientMethod(x0)

% initialization
xk=x0;
gk=grad_obj(xk);
dk=-gk;

% iteration
for i=1:length(x0)
    % line search
    alphak=fminbnd(@(alpha) phi(alpha,xk,dk),0,10);
    % update xk
    tempgk=gk;
    tempxk=xk;
    tempdk=dk;
    xk=tempxk+alphak*tempdk;
    gk=grad_obj(xk);
    tempbetak=(gk'*(gk-tempgk))/(dk'*(gk-tempgk));
    dk=-gk+tempbetak*tempdk;
end
xmin=xk;
fmin=obj(xk);

