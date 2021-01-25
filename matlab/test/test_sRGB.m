
clc;
clear;
close all;

addpath(genpath('..'));

n = 5;
XYZ = 10*rand(n, 3)-5;
sRGB = 10*rand(n, 3)-5;

xyz2rgb(XYZ) - XYZ2sRGB(XYZ)
rgb2xyz(sRGB) - sRGB2XYZ(sRGB)

XYZ - sRGB2XYZ(XYZ2sRGB(XYZ))
sRGB - XYZ2sRGB(sRGB2XYZ(sRGB))

D_65 = (linRGB_matrix^(-1) * [1; 1; 1])';
max(abs(D_65 - whitepoint('d65')))

%% Invertibility test

sizes = {...
    [1, 3], ... % one color
    [5, 3] ... % vector of colors
    };
max_err = 0;
for i = 1:size(sizes, 2)
    XYZ  = rand(sizes{i});
    sRGB = rand(sizes{i});
    err = zeros(1,2);
    err(1) = compare_data(  XYZ, sRGB2XYZ( XYZ2sRGB( XYZ)));
    err(2) = compare_data( sRGB, XYZ2sRGB( sRGB2XYZ(sRGB)));
    err = max(max(err));
    max_err = max(err, max_err);
end
max_err % should be ~zero