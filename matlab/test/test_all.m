
clc;
clear;
close all;

proLab_param
test_proLab
search_optimal_proLab_param

D65
get_datasets
reference_illuminant
testing_on_datasets

noise_model_verification
statistical_test
test_Canon5DMarkIII_spectralSensitivity
test_central_linearity
view_raw

vertex
sensor_noize_param
proLab_Jacobian

test_xyY
test_sRGB
test_spectral_math
test_LMS
test_linRGB_Y_const
test_Lab
test_is_color_cone
test_is_camera_sane
test_get_XYZ_sRGB_planes
test_get_XYZ_spectrum
test_get_STRESS
test_get_sample
test_get_quantum_noise
test_get_D65_spectrum
test_deviceRGB
test_decomposition
test_completeness
test_color_body
test_CIEDE2000_tria_ineq
test_CIEDE2000_symmetry
test_any

plot_simulate_camera_noise
plot_sample
% plot_image_color_distribution
plot_heteroscedasticity
plot_color_body
plot_chromaticity_frame
plot_chromaticity
plot_any_spectrum
% generate_all_images
for_introduction
