
clc;
clear;
close all;

addpath(genpath('..'));

d_lambda = 1;
lambda = (380:d_lambda:780)';
RGB = Canon5DMarkIII_spectralSensitivity(lambda);
x = sum(RGB);
x = x ./ x(2)
x = 1./x

figure(1);
hold on;
grid on;
plot(lambda, RGB(:,1), 'r');
plot(lambda, RGB(:,2), 'g');
plot(lambda, RGB(:,3), 'b');
plot(lambda, RGB(:,1), '.r');
plot(lambda, RGB(:,2), '.g');
plot(lambda, RGB(:,3), '.b');
