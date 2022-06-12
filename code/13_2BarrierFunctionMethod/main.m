funObj = @(x) objFun(x);
funCon = @(x) conFun(x);
lb = [-10;-10];
ub = [10;10];
[xstar,ystar] = barrierFunctionMethod(funObj,funCon,lb,ub)