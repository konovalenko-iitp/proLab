
clc;
clear;
close all;

addpath(genpath('..'));

d_lambda = 30;
tic
boundary_mesh = get_color_body_boundary_mesh(d_lambda);
toc

tic
[constraints, DT, C] = get_color_body_constraints(d_lambda);
toc
size(constraints)
mfilename('fullpath')
%%

figure();
hold on;
grid on;
plot3(boundary_mesh(:,1),boundary_mesh(:,2),boundary_mesh(:,3),'.');
axis equal;
xlabel('X');
ylabel('Y');
zlabel('Z');

%%

figure();
faceColor  = [0.6875 0.8750 0.8984];
tetramesh(DT,'FaceColor',faceColor,'FaceAlpha',0.3);

N = 10000;
XYZ_sample = reference_illuminant.*rand(N, 3);
idx = is_color_body(XYZ_sample, d_lambda);
XYZ_sample = XYZ_sample(idx, :);

figure();
hold on;
grid on;
camlight('headlight');
plot3(XYZ_sample(:, 1), XYZ_sample(:, 2), XYZ_sample(:, 3), '.b');
s = trisurf(C,DT.Points(:,1),DT.Points(:,2),DT.Points(:,3),'FaceColor','b','FaceAlpha',1.0);
s.EdgeColor = 'none';
xlabel('X');
ylabel('Y');
zlabel('Z');
ax = gca;
ax.Projection = 'perspective';
