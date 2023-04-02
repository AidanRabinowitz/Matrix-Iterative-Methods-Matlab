function [x, iterationCount] = JacobiMethod(A, b, x_0,tol)

rowLen = length(x_0);
colLen = size(A, 2);
xNew = zeros(rowLen, 1);
x = zeros(10, rowLen);
x(1, :) = x_0;

for it = 2:100
    for i = 1:rowLen
        xNew(i) = b(i);
        for j = 1:colLen
            if j ~= i
            xNew(i) = xNew(i) - A(i, j) * x(it-1, j);
            end
        end
        xNew(i) = xNew(i) / A(i, i);
    end
    x(it, :) = xNew';
        if max(abs(((x(it,:) - x(it-1,:))./x(it-1,:)))) < tol 
        return
        end
end
iterationCount = it - 1;
end
