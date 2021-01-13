
clc;
clear;
close all;

addpath(genpath('..'));

frame = imread('images/X-RITE-ColorChecker-Classic-Card-MSCCC.jpg');
% frame = imread('images/300px-Gretag-Macbeth_ColorChecker.jpg');
% frame = imread('images/01_2HAL_DESK_LED-BG100_cropped.jpg');
% frame = imread('images/02_2HAL_DESK_LED-BG100_cropped.jpg');
% frame = imread('images/03_2HAL_DESK_LED-BG100_cropped.jpg');
[h, w, c] = size(frame);
sRGB = reshape(frame, h*w, c);
sRGB = double(sRGB);
sRGB = sRGB + rand(size(sRGB));
sRGB = sRGB / 256;

set(gca, 'FontSize', 15);
FontSize = 20;
CS = color_spaces_collection('sRGB');
AO = CS.axis_Lab_order;

figure(1);
hold on;
% grid on;
% plot3(sRGB(:, 1), sRGB(:, 2), sRGB(:, 3), '.r');
s = scatter3(sRGB(:, 1), sRGB(:, 2), sRGB(:, 3), 7, sRGB, 'filled');
s.MarkerEdgeAlpha = 1.0;
xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
xlim([0 1]);
ylim([0 1]);
zlim([0 1]);
ax.Projection = 'perspective';
axis equal;
