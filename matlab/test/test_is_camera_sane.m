
clc;
clear;
close all;

addpath(genpath('..'));

sample_size = 10000;
XYZ_sample = get_sample(sample_size);
XYZ_sample = XYZ_sample{1};
size(XYZ_sample)

figure(1);
hold on;
plot3(XYZ_sample(:,1),XYZ_sample(:,2),XYZ_sample(:,3), '.b');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis equal;

options.check_camera_sane = true;
XYZ_sample = get_sample(sample_size, options);
XYZ_sample = XYZ_sample{1};
size(XYZ_sample)

figure(2);
hold on;
plot3(XYZ_sample(:,1),XYZ_sample(:,2),XYZ_sample(:,3), '.b');
xlabel('X');
ylabel('Y');
zlabel('Z');
axis equal;