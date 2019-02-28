clear all
close all
clc

%Problem 2, part b
tol = 1e-9;
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