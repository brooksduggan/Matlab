close all
clear all
clc
a=20;
[t,y] = ode45('odefun',[0 5],0.1,[],a); %[] reserves for tolerance level

plot(t,y)