clear all
close all
clc

f = @(x) (5-x).* exp(x) - 5;
%range in this situation
x=-1:.1:6;

% 1.
% (a)
plot(x, f(x));

% (d)
format long
tol = 1e-9;
a = 4;
b = 6;
c = (a+b)/2;
iter = 1;

while abs(f(c)) > tol
    if f(a)*f(c) > 0
        a = c;
    else
        b = c;
    end
    c =(a+b)/2;
    iter = iter + 1;
end

c
iter

