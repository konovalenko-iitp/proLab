
clc;
clear;
close all;

addpath(genpath('..'));

d_lambda = 0.5;
lambda = (300:d_lambda:800)';
formulary = '1931_FULL';
XYZ = get_XYZ_spectrum(lambda, formulary);
sum(XYZ, 1)

figure(1);
hold on;
plot(lambda, XYZ(:,1), 'r');
plot(lambda, XYZ(:,2), 'g');
plot(lambda, XYZ(:,3), 'b');
% plot(lambda, log(XYZ(:,1)), 'r');
% plot(lambda, log(XYZ(:,2)), 'g');
% plot(lambda, log(XYZ(:,3)), 'b');

figure(2);
plot3(XYZ(:,1),XYZ(:,2),XYZ(:,3));
xlabel('X');
ylabel('Y');
zlabel('Z');

figure(3);
hold on;
% plot_color_triangle_Y('CIExyY', 0.5);

lambda = [361; (400:2:690)'; 700];
formulary = '1931_FULL';
XYZ = get_XYZ_spectrum(lambda, formulary);
x = XYZ(:,1) ./ sum(XYZ, 2);
y = XYZ(:,2) ./ sum(XYZ, 2);
for i = 1:size(lambda)
    text(x(i), y(i), num2str(lambda(i)));
    plot(x(i), y(i), '.r');
end
axis equal;
xlabel('x');
ylabel('y');



