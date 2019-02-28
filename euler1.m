clear all
close all
clc

%solve y'= -y + ty^(1/2), with y(2) = 2, h = .25, from t = 2 to t= 3.
% f(t, y(t)) is = -y + ty^(1/2)

f = @ (t,y) -y + t*sqrt(y);
h = .000000005;
t = 2:h:3;
y = zeros(size(t));
y(1) = 2; %initial condition always goes in the first element.
n = length(t);

for k = 1:n-1
    
    y(k+1) = y(k) + h*f(t(k),y(k));
    
end

y_exact = (t-2 + sqrt(2)*exp(1-(t/2))).^2;

plot(t,y_exact, 'b', t,y,'r--')