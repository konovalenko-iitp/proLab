
clc;
clear;
close all;

addpath(genpath('..'));

syms x y z
syms h11 h12 h13 h14
syms h21 h22 h23 h24
syms h31 h32 h33 h34
syms h41 h42 h43 h44

X = (h11*x + h12*y + h13*z + h14) / (h41*x + h42*y + h43*z + h44);
Y = (h21*x + h22*y + h23*z + h24) / (h41*x + h42*y + h43*z + h44);
Z = (h31*x + h32*y + h33*z + h34) / (h41*x + h42*y + h43*z + h44);

dX = diff(X, x)
dX = simplify(dX)