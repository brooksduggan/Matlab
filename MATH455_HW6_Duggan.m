clear all
close all
clc
%insantiate the arrays and the true answer
t_ans = (1/2) - (exp(-2*pi)/2);
N = [11, 101, 1001, 10001, 100001, 1000001];
E = zeros(size(N));

n = 0;
%loop through each case of N to change the step size h
for i = 1:length(N)
    n = N(i);
    x = linspace(0,2*pi,n);
    y = exp(-x).*sin(x);
    %Adjust the step size
    H(i) = x(2) - x(1);
    %Calculate the approximate answer
    ap_ans = (H(i)/3)*(y(1)+y(end)+4*sum(y(2:2:end-1)) + 2*sum(y(3:2:n-2)));
    %Find the error between the approximate and the true answer
    E(i) = abs(t_ans - ap_ans);
end
loglog(H, E,'-o')


coeff = polyfit(log(H), log(E), 1);
coeff
% with a coeff of 2.4 is not as close to the theoretical which appears to
% be 10^-3