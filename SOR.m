function [x, iterationCount] = SOR(A, b, x_0, tol)
% A: coefficient matrix
% b: right-hand side vector
% x_0: initial guess
% omega: relaxation parameter (typically 1 < omega < 2)
% tol: tolerance for convergence
% maxIter: maximum number of iterations

rowLen = length(x_0);
colLen = size(A, 2);
xNew = zeros(rowLen, 1);
x = zeros(10, rowLen);
x(1, :) = x_0;
[V, D] = eigs(A, 1, 'largestreal');

% The largest eigenvalue is the real part of the corresponding diagonal element of D
EigenMax = real(D(1,1));
omega = 0.5;% 2/(1+sqrt(1-EigenMax^2))
for it = 2:100
    for i = 1:rowLen
        xNew(i) = b(i);
        for j = 1:colLen
            if j ~= i
                xNew(i) = xNew(i) - A(i, j) * x(j);
            end
        end
        xNew(i) = (1 - omega) * x(i) + omega * xNew(i) / A(i, i);
    end
    x(it, :) = xNew';
    %if norm(xNew - x(it-1, :)', Inf) < tol
     %   iterationCount = it - 1;
      %  x = x(1:iterationCount, :);
       % return
    %end
end
