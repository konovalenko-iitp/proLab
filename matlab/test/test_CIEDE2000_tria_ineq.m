
clc;
clear;

addpath(genpath('..'));

n = 200;
x = 1*rand(n,3);
y = 1*rand(n,3);
z = 1*rand(n,3);
d_lambda = 10;
idx_x = is_color_body(x, d_lambda);
idx_y = is_color_body(y, d_lambda);
idx_z = is_color_body(z, d_lambda);
idx = idx_x & idx_y & idx_z;
x = x(idx, :);
y = y(idx, :);
z = z(idx, :);
is_color_body(x, d_lambda)'
is_color_body(y, d_lambda)'
is_color_body(z, d_lambda)'

get_CIEDE2000({x y}, 'CIE XYZ') + get_CIEDE2000({y z}, 'CIE XYZ') - get_CIEDE2000({x z}, 'CIE XYZ')





