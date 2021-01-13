
clc;
clear;

addpath(genpath('..'));

XYZ = rand(1, 3);
max(abs(XYZ - xyY2XYZ(XYZ2xyY(XYZ))))

xyY = rand(1, 3);
max(abs(xyY - XYZ2xyY(xyY2XYZ(xyY))))

