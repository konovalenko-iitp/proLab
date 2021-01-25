
clc;
clear;

param_m.m = [2.1591 -1.7823 -0.0713 2.0865 0.2103 0.7554 3.8666 1.6739];
Q_m = m2Q(param_m)
param = proLab_param;
Q = param.Q

abs((Q - Q_m) ./ Q_m)

param_m
param

XYZ = get_sample(10);
handle_m = color_dist('proLab', param_m);
CD_m = handle_m(XYZ);
handle = color_dist('proLab', param);
CD = handle(XYZ);
CD./CD_m