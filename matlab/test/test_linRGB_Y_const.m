
clc;
clear;
close all;

addpath(genpath('..'));

L = 50;
XYZ = Lab2XYZ([L 0 0]);
Y = XYZ(2);

M = linRGB_matrix;
M = [M, [0; 0; 0]; [0 0 0 1]];
u = [0 1 0 -Y];
v = u * M^(-1)
sRGB_0 = -v(4)./v(1:3)


