
clc;
clear;
close all;

addpath(genpath('..'));

local_size = 1000;
mean_N = [10 10 10];
models = {'Poisson', 'Normal_approx'};

for m = 1:size(models,2)
    tic;
    N = get_quantum_noise(mean_N, local_size, models{m});
    toc;
    N = N(:);
    figure(m);
    histfit(N);
end
