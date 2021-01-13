
clc;
clear;
close all;

addpath(genpath('..'));

n = 10;
k = 3;
I = rand(n, 1);
xyz = rand(n, k);

XYZ = I' * xyz 
p = (xyz' * xyz)^(-1) * XYZ';
[U, ~, ~] = svd(xyz * xyz');
II = xyz * p + U(:, (k+1):end) * randn(n-k,1);
XYZ_1 = II' * xyz
XYZ_2 = XYZ * (xyz' * xyz)^(-1) * xyz' * xyz
