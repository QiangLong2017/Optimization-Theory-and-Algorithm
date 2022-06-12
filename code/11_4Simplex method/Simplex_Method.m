% only for 2-dimensional problem

function [xmin,fmin]=Simplex_Method(X)

epsilon=1e-8;
k=0;

% initialize simplex
F=zeros(3,1);
F(1)=objective_fun(X(:,1));
F(2)=objective_fun(X(:,2));
F(3)=objective_fun(X(:,3));
[F,temp2]=sort(F);
X=X(:,temp2);
xs=X(:,1); fs=F(1);
xm=X(:,2); fm=F(2);
xl=X(:,3); fl=F(3);

% main loop
while 1
    % generate the symmetrical point of xl with respect to [xs,xm]
    xm_prime=(xm+xs)/2;
    fm_prime=objective_fun(xm_prime);
    x1=xl+2*(xm_prime-xl);
    
    % four different situations
    f1=objective_fun(x1);
    if f1<fs
        x2=x1+0.5*(xm_prime-xl);
        f2=objective_fun(x2);
        if f1<=f2
            xl=xm; fl=fm;
            xm=xs; fm=fs;
            xs=x1; fs=f1;
        else
            xl=xm; fl=fm;
            xm=xs; fm=fs;
            xs=x2; fs=f2;
        end
    elseif f1>=fs && f1<fm
        xl=xm; fl=fm;
        xm=x1; fm=f1;
        % xs, fs no change
    elseif f1>=fm && f1<fl
        xl=x1; fl=f1;
        % xm, fm no change
        % xs, fs no change
    else
        x3=x1-0.5*(xm_prime-x1);
        f3=objective_fun(x3);
        if f3<fs
            xl=xm; fl=fm;
            xm=xs; fm=fs;
            xs=x3; fs=f3;
        elseif f3>=fs && f3<fm
            xl=xm; fl=fm;
            xm=x3; fm=f3;
            % xs, fs no change;
        elseif f3>=fm && f3<fl
            xl=x3; fl=f3;
            % xm, fm no change
            % xs, fs no change
        else
            xl_prime=(xl+xs)/2;
            fl_prime=objective_fun(xl_prime);
            % sort again
            X=[xs xl_prime xm_prime];
            F=[fs,fl_prime,fm_prime];
            [F,temp2]=sort(F);
            X=X(:,temp2);
            xs=X(:,1); fs=F(1);
            xm=X(:,2); fm=F(2);
            xl=X(:,3); fl=F(3);
        end
    end
    k=k+1;
    
    % stop criteria
    if (norm(xl-xs)+norm(xm-xs))/2<=epsilon && sqrt(((fl-fs)^2+(fm-fs)^2)/2)<=epsilon
        xmin=xs;
        fmin=fs;
        k
        return
    end
end
    
            
    

