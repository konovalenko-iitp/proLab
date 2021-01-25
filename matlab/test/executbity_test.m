
clc;
clear;
close all;

addpath(genpath('..'));

%% trunk\matlab

code_examples
D65
proLab_param
proLab_reference_values
reference_illuminant
search_optimal_proLab_param

%% trunk\matlab\color_conversions

deviceRGB_matrix
deviceRGB2linRGB_matrix
linRGB_matrix
LMS_matrix

%% trunk\matlab\data

get_datasets
testing_on_datasets

%% trunk\matlab\research

noise_model_verification
statistical_test
test_Canon5DMarkIII_spectralSensitivity
test_central_linearity
view_raw

%% trunk\matlab\search_optimal_proLab_param

culc_P
get_sample_temp
get_XYZ_sRGB_planes
proLab_Jacobian
sensor_noize_param
vertex

%% trunk\matlab\test

check_conditions
check_mQ_compliance
test_any
test_CIEDE2000_symmetry
test_CIEDE2000_tria_ineq
test_color_body
test_completeness
test_decomposition
test_deviceRGB
test_get_D65_spectrum
test_get_quantum_noise
test_get_sample
test_get_STRESS
test_get_XYZ_spectrum
test_get_XYZ_sRGB_planes
test_is_camera_sane
test_is_color_cone
test_Lab
test_linRGB_Y_const
test_LMS
test_proLab
test_spectral_math
test_sRGB
test_xyY

%% trunk\matlab\visualization

for_introduction
generate_all_images
plot_any_spectrum
plot_chromaticity
plot_chromaticity_frame
plot_color_body
plot_heteroscedasticity
% plot_image_color_distribution
plot_sample
plot_simulate_camera_noise
plot_sRGB_gamut








