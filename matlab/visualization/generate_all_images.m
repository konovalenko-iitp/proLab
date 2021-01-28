
clc;
clear;
close all;

addpath(genpath('..'));

imag_folds = {'sample', 'chromaticity', 'heteroscedasticity', 'body'};
for i = 1:size(imag_folds, 2)
    try
        eval(['rmdir images/', imag_folds{i}, ' s']);
    end
    eval(['mkdir images/', imag_folds{i}]);
end
 
run plot_sample
run plot_chromaticity
run plot_simulate_camera_noise
run plot_heteroscedasticity
run plot_sRGB_gamut
run plot_color_body
