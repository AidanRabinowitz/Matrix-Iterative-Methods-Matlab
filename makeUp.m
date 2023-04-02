function [D,L,U] = makeUp(A)
rowLen = size(A,1);
colLen = size(A,2);
D = zeros(rowLen,colLen)
L = zeros(rowLen,colLen)
U = zeros(rowLen,colLen)

%Take out the diagonal
for i = 1:rowLen
    D(i,i) = A(i,i);
end
    
%Take out the lower triangular matrix
for i = 1:rowLen
    for j =1:colLen
        if i<j
            U(i,j) = A(i,j);
        end
    end
end
%Take out the upper triangular matrix
for i = 1:rowLen
    for j =1:colLen
        if i>j
            L(i,j) = A(i,j);
        end
    end
end
U
end