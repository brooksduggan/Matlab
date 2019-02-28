clear all
close all
clc

% Jacobian is exactly like the Newton, but it is with vectors/Matrix.  The
% norm() replaces the abs() function.  M*xnew = b - N*xold => xnew =
% (b-N*xold)\M |  M = sparse(diag(diag(A)));  N = sparse(A-M);  Converges:
% |1-a/m|<1 |  rho(eig(eye(3,3) - inv(M)*A)) < 1  | if not SDD, sommetimes
% it'll converge and sometimes it will not.  on problem c, Jacobi fails but
% Gaus-Siedel works.  Why does it work? Even though the matrix is not SDD,
% previous equation is fulfilled though so that's why it works.

%FOR EACH PROBLEM, I INSERTED "RETURN" STATEMENTS...BE SURE TO REMOVE THEM
%Problem 1, part a
%Initialize variables
A= [2 -1 1;1 1 1;-1 -1 2];
b = [-1; 2; -5];
tol = 1e-9;
%Initialize matrices M and N
M1 = sparse(diag(diag(A)));
N1= sparse(A-M1);
xo = [0; 0; 0];
jacsol = xo;
for o =1:1000
    c = M1\(b - N1*xo);
    jacsol = [o; c];
    if norm(A*c-b)<tol && norm(c - xo) < tol
        jacsol
        c
        o
        break
    else
        xo = c;
    end
    
end
%vvvvvv
%return
%^^^^^^ be sure to remove this for next question (this was to show that it
%did not converge)

% Problem 1, part b
M2 = sparse(tril(A));
N2 = sparse(A - M2);

x0 = [0; 0; 0];
seidsol = x0;

for p = 1:1000
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
%Problem 1, part c
% The reason the Gauss-Seidel algorithm converges is because the Jacobi
% algorithm is dependent on the matrix A being Strictly Diagonally Dominant
% whereas the Guass-Seidel is only necessary to have the matrix A's
% spectral radius less than 1.

%vvvvv
%return
%^^^^^ Remove this return for problem 2

% Problem 2, part a
% When if (?, ?) is a solution, then (?, -?) is a solution because x_2 is
% squared in the system of equations.  Therefore, the sign infront of the ?
% does not matter as it is plugged in for x_2.

%Problem 2, part b
Func = @(x) [3*x(1)^2 - x(2)^2; 3*x(1)*(x(2)^2) - (x(1)^3)];
Jac = @(x) [6*x(1) , -2*x(2);3*x(2)^2 , 0];
newtxo = [1;5];

newtsol = newtxo.';
for j = 1:1000
    d = Jac(newtxo)\(-Func(newtxo));
    newtx = newtxo + d;
    newtsol = [newtsol; newtx.'];
    
    if norm(Func(newtx)) < tol && norm(newtx - newtxo) < tol
        newtsol
        j
        break
    end
    newtxo = newtx;
end