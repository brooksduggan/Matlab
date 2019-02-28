clear all
close all
clc

f = @(x) (5 - x).*exp(x) - 5;
df = @(x) -exp(x).*(x - 4);
tol = 1e-6;
xold = 1.24;
solution = xold;
N = 100;

for j = 1:N
    xnew = xold - f(xold)/df(xold);
    
    solution = [solution;xnew];
    if abs(f(xnew)) < tol && abs(xnew-xold) < tol
        solution
        j
        break
    else
        xold = xnew;
    end
end