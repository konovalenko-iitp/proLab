
clc;
clear;

param = proLab_param;
format long
N = (diag([D65 1])^(-1))
P = param.Q * N
format