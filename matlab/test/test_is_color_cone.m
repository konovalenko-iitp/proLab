
clc;
clear;
close all;

addpath(genpath('..'));
   
figure();
hold on;

XYZ = reference_illuminant .* rand(10000, 3);
x = XYZ(:,1) ./ sum(XYZ, 2);
y = XYZ(:,2) ./ sum(XYZ, 2);
plot(x,y,'.r');
idx = is_color_cone(XYZ);
x = x(idx, :);
y = y(idx, :);
plot(x,y,'.b');
% plot_color_triangle_Y('CIExyY', 0.5);
axis equal;
xlabel('x');
ylabel('y');