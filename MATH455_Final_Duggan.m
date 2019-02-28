clear all
close all
clc
%%% Problem 1 %%%
%define f and its derivative
f = @(x) (10.*x.^2).*exp(-x)-2;
df = @(x) 20*x*exp(-x)-(10*x^2)*exp(-x);
tol = 1e-9;
%Initial guess of -1
xold = -1;
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
%REMOVE THIS TO MOVE ON TO NEXT PROBLEM
return
%%% Problem 2 %%%
Func = @(x) [-2*x(1)+x(2)+1;2*x(1)+3*x(2)-5];

Jac = @(x) [-2 1;2 3];
tol = 1e-9;

xold = [3002;407];

for p = 1:1000
   
   c = Jac(xold) \ -Func(xold);
   xnew = xold + c;
   
   if norm(Func(xnew)) < tol && norm(xnew-xold) < tol
       xnew
       p
       break
   else
       xold = xnew;
   end
end
%%p is the amount of iterations that it takes to converge. This does not seem to be a coincidence
%%as if you plug in 1 for both x and y, that would solve the system of equations very quickly, as they are linear equations%%

%%%COMMENT THIS OUT TO MOVE ON
return
%%%Problem 3%%%
%%% This is third order
clc
n=101;
x = (linspace(0,2*pi, n)).';
h = x(2)-x(1);
f = cos(x);

e1 = ones(n,1);
D = spdiags([-e1/2,e1,-e1,e1/2],[-2,-1,1,2],n,n);
D(1,1) = -1; D(1,2) = 3; D(1,3)=-3; D(1,4)=1;
D(2,1) = -1; D(2,2) = 3; D(2,3)=-3; D(2,4)=1;
D(n-1,n-3) = -1; D(n-1,n-2)=3; D(n-1,n-1)=-3; D(n-1,n)= 1;
D(n,n-3) = -1; D(n,n-2)=3; D(n,n-1)=-3; D(n,n)= 1;
D = D/(h^3);

dddf_theo = sin(x);
dddf_num = D*f;
plot(x,dddf_theo,'b',x,dddf_num,'ro');
legend('F', 'Theoretical derivative')
%REMOVE THIS FOR NEXT QUESTION
return
%%%PROBLEM 5%%%
h = .05;
t = [0:h:50];
n = length(t);
y_exact = sin(t)+exp(-20.*t);
y = zeros(size(y_exact));
y(1) = 1;
f = @(t,y) 20*sin(t)+cos(t)-20*y;
y_trap = y;
y_heu = y;

for k = 1:n-1
    
    %a
    y_trap(k+1) = (y_trap(k) + (h/2)*(f(t(k),y_trap(k))+ 20*sin(t(k+1))+ cos(t(k+1))))/(1+10*h);
    
    %b
    y_hat = y_heu(k) + h*f(t(k),y_heu(k));
    y_heu(k+1) = y_heu(k) + (h/2)*(f(t(k),y_heu(k))+f(t(k+1),y_hat));

end

plot(t,y_exact,'k-.',t,y_heu,'r--', t,y_trap,'m--')
%The trapezoidal method is more preferable in this case because when the
%step size is increased to something such as .1, the Huen's method begins to differ
%greatly from the exact answer compared to the trapezoidal (the Trapezoidal
%method has a larger range for h - the step size.