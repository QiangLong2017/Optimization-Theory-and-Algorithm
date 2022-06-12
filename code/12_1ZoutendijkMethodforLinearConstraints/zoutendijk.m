%-------------------------------------
% Zoutendijk feasible direction method
%-------------------------------------
function [xstar,ystar] = zoutendijk(fun,A,b,E,e)

epsilon = 0.01;

% Initial feasible point
x = inifeapoi(A,b,E,e);

% Iteration 
while 1
    % Feasible descent direction
    [d,grad] = feadesdir(fun,A,b,E,e,x);
    
    % If it is a K-T point
    if abs(grad'*d) <= epsilon
        xstar = x;
        ystar = fun(xstar);
        return;
    end
    
    % Line search 
    lambda = linesearch(fun,A,b,x,d);
    
    % Update
    x = x+lambda*d;
end

%-------------------------------------
% Initial feasible point
%-------------------------------------
function x = inifeapoi(A,b,E,e)
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

%-------------------------------------
% Feasible descent direction
%-------------------------------------
function [d,grad] = feadesdir(fun,A,b,E,e,x)
epsilon = 0.01;
[~,grad] = fun(x);
temp = A*x;
A1 = A(temp<=b+epsilon,:);
f = grad';
Aineq = -A1;
bineq = zeros(length(Aineq(:,1)),1);
if isempty(E)
    Aeq = E;
    beq = e;
else
    Aeq = E;
    beq = zeros(length(Aeq(:,1)),1);
end
lb = -1*ones(length(x),1);
ub = ones(length(x),1);
d = linprog(f,Aineq,bineq,Aeq,beq,lb,ub);

%-------------------------------------
% Line search
%-------------------------------------
function lambda = linesearch(fun,A,b,x,d)
epsilon = 0.01;
temp = A*x;
A1 = A(temp<=b+epsilon,:);
A2 = A(temp>b+epsilon,:);
b1 = b(temp<=b+epsilon);
b2 = b(temp>b+epsilon);
b_hat = b2-A2*x;
d_hat = A2*d;
if all(d_hat>=0)
    lambda_max = 10;
else
    lambda_max = min(b_hat(d_hat<0)./d_hat(d_hat<0));
end
lineobjfun = @(lambda) fun(x+lambda*d);
lambda = fminbnd(lineobjfun,0,lambda_max);


