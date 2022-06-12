c = [-4 -1 0 0 0]';
b = [4 12 3]';
A = [-1 2 1 0 0;2 3 0 1 0;1 -1 0 0 1];
[xstar,fstar] = linProg(c,A,b)