clear all
close all
clc

h = 20;
t = [0:h:100];
n = length(t);
y_exact = exp(-.1*t);
y_for = zeros(size(y_exact));
y_for(1) = 1;
y_back = zeros(size(y_exact));
y_back(1) = 1;

for k = 1:n-1
    y_for(k+1) = (1-.1*h)*y_for(k);
    y_back(k+1) = y_back(k)/(1+.1*h);
end

plot(t, y_exact,'b',t,y_for,'r-x',t,y_back,'k-o')