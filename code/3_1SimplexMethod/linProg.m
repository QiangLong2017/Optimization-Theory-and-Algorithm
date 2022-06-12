function [xstar,fstar] = linProg(c,A,b)
[m,n] = size(A);
x = zeros(n,1);
[B_idx,N_idx] = baseMat(A);         % Initial base and non-base matrix
% B_idx = [3 4 5];
% N_idx = [1 2];

while 1
    B_idx
    N_idx
    x_B = ((A(:,B_idx))^-1)*b;      % Base variables
    x(B_idx) = x_B;                 % Initial solution
    f = c'*x;                       % Initial objective function value
    w = c(B_idx)'*((A(:,B_idx))^-1);% Simplex multiplier
    z_c = w*A(:,N_idx)-c(N_idx)';   % Discrimination number
    [zk_ck,k] = max(z_c);           % out-bese variable
    k = N_idx(k);
    if zk_ck <= 0                   % optimal solution founded
        xstar = x;
        fstar = f;
        return
    else
        yk = ((A(:,B_idx))^-1)*A(:,k);
        if all(yk<=0)               % No finite solution
            disp('No finite solution')
            xstar = x;
            fstar = f;
        else
            yk0_idx = find(yk>0);   % entry-base variable
            [x(k),r] = min(x_B(yk0_idx)./yk(yk0_idx)); % enter base
            r = B_idx(yk0_idx(r));
            x(r) = 0;               % out base
            B_idx(B_idx==r) = [];
            B_idx = [B_idx k];
            N_idx(N_idx==k) = [];
            N_idx = [N_idx r];
        end
    end
end
            
function [B_idx,N_idx] = baseMat(A)
[m,n] = size(A);
combs = combntns(1:1:n,m);
for comb = combs'
    B = A(:,comb);
    if abs(det(B)) >= 0.01
        B_idx = comb;
        N_idx = setdiff(1:1:n,B_idx);
        return
    end
end