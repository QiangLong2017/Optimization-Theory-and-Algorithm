x0 = [0;0];
funObj = @(x) objFun(x);
funCon = @(x) conFun(x);
[xstar,ystar] = exteriorPenalty(funObj,funCon,x0)