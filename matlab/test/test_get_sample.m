
clc;
clear;
close all;

addpath(genpath('..'));

sample_size = 1000;
XYZ_sample = get_sample(sample_size);
% borders = [20, 140];
% XYZ_sample = get_sample(sample_size, borders);
size(XYZ_sample{1})
CIEDE2000 = get_CIEDE2000(XYZ_sample, 'CIE XYZ');

figure(1);
hold on;
for i = 1:size(XYZ_sample{1}, 1)
%     plot3(XYZ_sample{1}(i,1), ...
%           XYZ_sample{1}(i,2), ...
%           XYZ_sample{1}(i,3), '.b');
    plot3([XYZ_sample{1}(i,1) XYZ_sample{2}(i,1)], ...
          [XYZ_sample{1}(i,2) XYZ_sample{2}(i,2)], ...
          [XYZ_sample{1}(i,3) XYZ_sample{2}(i,3)], 'b');
end
xlabel('X');
ylabel('Y');
zlabel('Z');
% axis equal;

Lab_sample = XYZ2Lab(XYZ_sample);

figure(2);
hold on;
for i = 1:size(Lab_sample{1}, 1)
    plot3([Lab_sample{1}(i,1) Lab_sample{2}(i,1)], ...
          [Lab_sample{1}(i,2) Lab_sample{2}(i,2)], ...
          [Lab_sample{1}(i,3) Lab_sample{2}(i,3)], 'b');
end
xlabel('L');
ylabel('a');
zlabel('b');
% axis equal;
% sqrt(sum((Lab_sample{1} - Lab_sample{2}).^2, 2))

figure(3);
hold on;
grid on;
% title('Uniform random visible gamut D65 XYZ color couples');
hist(CIEDE2000, 100, 'kernel');
xlabel('CIEDE2000');
ylabel('frequence');

handle = color_dist('CIELAB');
LabDist = handle(XYZ_sample);

figure(4);
hold on;
grid on;
% title('Uniform random visible gamut D65 XYZ color couples');
hist(LabDist, 100, 'kernel');
xlabel('||Lab||');
ylabel('frequence');

XYZ_sample = XYZ_sample{1};
Lab_sample = Lab_sample{1};

% idx_1 = 0.5-0.05<sum(XYZ_sample, 2);
% idx_2 = sum(XYZ_sample, 2)<0.5+0.05;
% idx = idx_1 & idx_2;
% XYZ_sample = XYZ_sample(idx, :);

figure(5);
hold on;
plot3(XYZ_sample(:,1),XYZ_sample(:,2),XYZ_sample(:,3), '.b');
xlabel('X');
ylabel('Y');
zlabel('Z');
% axis equal;

figure(6);
hold on;
plot3(Lab_sample(:,1),Lab_sample(:,2),Lab_sample(:,3),'.b');
xlabel('L');
ylabel('a');
zlabel('b');
% axis equal;

