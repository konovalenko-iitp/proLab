
clc;
clear;
close all;

addpath(genpath('..'));

X = rand(3, 1);
Y = rand(3, 1);
% get_STRESS(X,Y) - get_STRESS(Y,X)

get_STRESS(X,Y)
sqrt(((X'*X)*(Y'*Y)-(Y'*X).^2)./ ((Y'*Y)*(X'*X)))

Cos2 = (Y'*X).^2 / ((Y'*Y)*(X'*X));
Sin = sqrt(1-Cos2)