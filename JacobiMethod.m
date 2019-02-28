clear all
close all
clc

%Problem 1, part a
%Initialize variables
A= [2,3;-2,1];
b = [5;-1];
tol = 1e-9;
%Initialize matrices M and N
M1 = sparse(diag(diag(A)));
N1= sparse(A-M1);
xo = [100;100];
jacsol = xo;

for o =1:1000
    c = M1\(b - N1*xo);
    jacsol = [jacsol; c];
    if norm(A*c-b)<tol && norm(c - xo) < tol
        jacsol
        c
        o
        break
    else
        xo = c;
    end
    
end
