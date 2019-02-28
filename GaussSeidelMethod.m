clear all
close all
clc

A= [2 3;-2 1];
b = [5;-1];
tol = 1e-9;
% Problem 1, part b
M2 = sparse(tril(A));
N2 = sparse(A - M2);

x0 = [17;3];
seidsol = x0;

for p = 1:100
    x = M2\(b - N2*x0);
    seidsol = [seidsol; x];
    if norm(A*x-b)<tol && norm(x - x0) < tol
        seidsol
        x
        p
        break
    end
    x0 = x;
end