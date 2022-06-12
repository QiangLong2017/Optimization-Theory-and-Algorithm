%-------------------------------------
% Exterior penality function method
%-------------------------------------
function [xstar,ystar] = exteriorPenalty(funObj,funCon,x0)

sigma = 1;
c = 2;
epsilon = 0.01;
x = x0;

while 1
    % Constrate the penality term as a function
    penTerm = penalityTerm(funCon,sigma);
    
    % Constrate the exterior penality function
    penFun = penalityFunction(funObj,penTerm);
    
    % Solve auxiliary problem
    x = fminsearch(penFun,x);
    
    if penTerm(x) < epsilon
        % x is a K-T point
        xstar = x;
        ystar = funObj(x);
        fprintf('sigma = %f',sigma)
        return
    else
        % Increase penality factor
        sigma = c*sigma;
    end
end

%-------------------------------------
% Constrate the penality term as a function
%-------------------------------------
function penTerm = penalityTerm(funCon,sigma)
y = @(x) funCon(x);
penTerm = @(x) sigma*(sum(max(0,-y(x)).^2));

%-------------------------------------
% Constrate the exterior penality function
%-------------------------------------
function penFun = penalityFunction(funObj,penTerm)
penFun = @(x) funObj(x)+penTerm(x);




    


