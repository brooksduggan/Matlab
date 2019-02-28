clear all
close all
clc

%initialize the rate of change and time variables, along with the exact y
%and estimated y
h = .1;
t = [0:h:2];
n = length(t);
y_exact = (2-exp(t) + 4*t + 2*t.^2)/2;
y = zeros(size(y_exact));
y(1) = .5;
f = @(t,y) y - t^2 +1;
y_for = y;
y_trap = y;
y_heu = y;
y_kut = y;


for k = 1:n-1
    y_for(k+1) = y_for(k) + h*f(t(k),y_for(k));
    %trapezoidal method
    y_trap(k+1) = (y_trap(k) + (h/2)*(y_trap(k) - t(k).^2 -t(k+1).^2 +2))/(1-(h/2));
    
    %Hue's Method
    y_heu(k+1) = y_heu(k) + h*f(t(k),y_heu(k));
    y_heu(k+1) = y_heu(k) + (h/2)*(f(t(k),y_heu(k))+f(t(k+1),y_heu(k+1)));
    
    %Rung-Kutta Method
    q1 = f(t(k),y_kut(k));
    q2 = f(t(k)+h/2, y_kut(k)+h*q1/2);
    q3 = f(t(k)+h/2, y_kut(k)+h*q2/2);
    q4 = f(t(k+1),   y_kut(k)+h*q3  );   
    y_kut(k+1) = y_kut(k) + (h/6)*(q1+2*q2+2*q3+q4);
end
%plot all data according to each estimation
plot(t,y_exact,'k',t,y_for,'--r',t,y_heu,'y--',t,y_kut,'b--', t,y_trap,'m--')