
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