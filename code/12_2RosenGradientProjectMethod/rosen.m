%-------------------------------------
% Rosen gradient projection method
%-------------------------------------
function [xstar,ystar] = rosen(fun,A,b,E,e)

epsilon = 0.01;

% Initial feasible point
x = iniFeaPoi(A,b,E,e);

% Iteration 
while 1
    % Separate active constraints 
    A1 = activeCon(A,b,x);
    
    while 1  
        M = [A1;E];
        % Compute gradient project direction
        [~,grad] = fun(x);
        P = gradProjMat(M,x);
        d = -P*grad;
            
        % If d is zero
        if norm(d) <= epsilon
            % If M is empty£¬x is a local minimum
            if isempty(M)
                xstar = x;
                ystar = fun(xstar);
                return;
            else
                W = (M*M')^-1*M*grad;
                u = W(1:length(A1(:,1)));
                % If all u>=0, x is a K-T point
                if all(u>=0)
                    xstar = x;
                    ystar = fun(xstar);
                    return;
                else
                    [~,j] = min(u);
                    A1(j,:) = [];
                    continue;
                end
            end
        else
            break;
        end
    end
    
    % Line search 
    lambda = linesearch(fun,A,b,x,d);
    
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
% Separate active constraints
%-------------------------------------
function A1 = activeCon(A,b,x)
epsilon = 0.01;
act_idx = A*x<=b+epsilon;
A1 = A(act_idx,:);

%-------------------------------------
% Compute gradient projection matrix
%-------------------------------------
function P = gradProjMat(M,x)
 if isempty(M)
    P = eye(length(x));
 else
    P = eye(length(x))-M'*(M*M')^-1*M;
 end

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




    


