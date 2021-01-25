
clc;
clear;

param_m.m = [2.1591 -1.7823 -0.0713 2.0865 0.2103 0.7554 3.8666 1.6739];
g = penalty(param_m)

param = proLab_param;
Q = param.Q;

disp(det(Q))
disp(Q(4, 1:3) * vertex' + 1)
l = [1 0 0 0; 1 0 0 -100];
disp(l * Q)