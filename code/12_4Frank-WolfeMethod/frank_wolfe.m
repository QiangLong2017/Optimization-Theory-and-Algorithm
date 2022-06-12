%-------------------------------------
% Frank&Wolfe method
%-------------------------------------
function [xstar,ystar] = frank_wolfe(fun,A,b,E,e)

epsilon = 0.01;

% Initial feasible point
x = iniFeaPoi(A,b,E,e);

% Iteration 
while 1
    % Solve linear programming problem
    [~,grad] = fun(x);
    f = grad';
    Aineq = -A;
    bineq = -b;
    Aeq = E;
    beq = e;
    y = linprog(f,Aineq,bineq,Aeq,beq);
    
    % Direction
    d = y-x;
    
    if grad'*d >= -epsilon
        % x is a K-T point
        xstar = x;
        ystar = fun(x);
        return;
    else
        % Line search 
        lambda = linesearch(fun,x,d);
    end
    
    % Update
    x = x+lambda*d;
end

%-------------------------------------
% Initial feasible point
%-------------------------------------
function x = iniFeaPoi(A,b,E,e)
f = @(x) 0.5*(norm(E*x-e))^2;
while 1
    [~,n] = size(A);
    x = -5+10*rand(n,1);
    if ~isempty(E)
        x = fminsearch(f,x);
    end
    if all(A*x >= b)
        break
    end
end
x = [0,0]';

%-------------------------------------
% Line search
%-------------------------------------
function lambda = linesearch(fun,x,d)
lineobjfun = @(lambda) fun(x+lambda*d);
lambda = fminbnd(lineobjfun,0,1);




    


