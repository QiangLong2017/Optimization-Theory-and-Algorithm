%-------------------------------------
% Barrier function method
%-------------------------------------
function [xstar,ystar] = barrierFunctionMethod(funObj,funCon,lb,ub)

r = 5;
beta = 0.5;
epsilon = 0.01;

% Initial feasible point
x = iniFeaPoi(funCon,lb,ub);

while 1
    % Constrate the barrier term
    barTerm = barrierTerm(funCon,r);
    
    % Constrate the barrier function
    barFun = barrierFunction(funObj,barTerm);
    
    % Solve auxiliary problem
    x = fminsearch(barFun,x);
    con = funCon(x);
    fprintf('r = %f£¬barTerm = %f, y = %f\n',r,barTerm(x),con(1))
    
    if barTerm(x) < epsilon
        % x is a solution
        xstar = x;
        ystar = funObj(x);
        fprintf('r = %f£¬barTerm = %f%',r,barTerm(x))
        return
    else
        % Decrease barrier factor
        r = beta*r;
    end
end

%-------------------------------------
% Initial feasible point
%-------------------------------------
function x = iniFeaPoi(funCon,lb,ub)
while 1
    x = lb+rand*(ub-lb);
    if all(funCon(x) >= 0)
        break
    end
end

%-------------------------------------
% Constrate the barrier term
%-------------------------------------
function barTerm = barrierTerm(funCon,r)
y = @(x) funCon(x)+0.01;
barTerm = @(x) r*(sum(1./y(x)));
% barTerm = @(x) -r*(sum(log(y(x))));

%-------------------------------------
% Constrate the exterior penality function
%-------------------------------------
function barFun = barrierFunction(funObj,barTerm)
barFun = @(x) funObj(x)+barTerm(x);




    


