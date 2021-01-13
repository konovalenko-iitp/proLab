
clc;
clear;
close all;

addpath('color_conversions');

[XYZ, ECD] = get_datasets;
[(1:size(XYZ{1},1))', XYZ{1}, XYZ{2}, ECD]

% distance_CIEDE2000 = get_CIEDE2000(XYZ);
% criter_name = 'pca';
% Criterion(distance_CIEDE2000, ECD, criter_name);
% plot(ECD, distance_CIEDE2000, '.b');
% xlabel('$ECD$','Interpreter','latex','FontSize', 14);
% xlabel('Experimantal color difference','FontSize', 14);
% ylabel('$\Delta E^*_{00}$','Interpreter','latex','FontSize', 14);