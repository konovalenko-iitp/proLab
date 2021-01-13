
clc;
clear;
close all;

addpath(genpath('..'));

d_lambda = 0.5;
lambda = (200:d_lambda:900)';
D65_spectrum = get_D65_spectrum(lambda);

figure(1);
plot(lambda, D65_spectrum, '.');

formulary = '1931_FULL';
XYZ = get_XYZ_spectrum(lambda, formulary);

source = XYZ .* D65_spectrum;
D_65 = sum(source, 1);
D_65 = D_65/D_65(2);
[D_65 D65]