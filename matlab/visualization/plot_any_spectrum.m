
clc;
clear;
close all;

addpath(genpath('..'));

d_lambda = 0.5;
lambda = (300:d_lambda:800)';
formulary = '1931_FULL';
XYZ = get_XYZ_spectrum(lambda, formulary);

fig = figure(1);
hold on;
grid on;
title('CIEXYZ');
plot(lambda, XYZ(:,1), 'r');
plot(lambda, XYZ(:,2), 'g');
plot(lambda, XYZ(:,3), 'b');
pic_name = 'images/CIEXYZ.png';
% saveas(fig, pic_name);

% CC = XYZ * LMS_matrix';
CC = XYZ2deviceRGB(XYZ);

fig = figure(2);
hold on;
grid on;
% title('LMS');
title('deviceRGB');
plot(lambda, CC(:,1), 'r');
plot(lambda, CC(:,2), 'g');
plot(lambda, CC(:,3), 'b');
% pic_name = ['images/linRGB.png'];
% saveas(fig, pic_name);