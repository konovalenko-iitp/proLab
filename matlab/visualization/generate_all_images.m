
clc;
clear;
close all;

addpath(genpath('..'));

try
    rmdir images s
end

mkdir images
mkdir images sample
mkdir images chromaticity
mkdir images heteroscedasticity
mkdir images body

run plot_sample
run plot_chromaticity
run plot_simulate_camera_noise
run plot_heteroscedasticity
run plot_sRGB_gamut
run plot_color_body
