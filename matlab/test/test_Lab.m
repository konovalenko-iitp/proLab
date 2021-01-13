
clc;
clear;

addpath(genpath('..'));

XYZ = rand(1, 3);
max(abs(XYZ - Lab2XYZ(XYZ2Lab(XYZ))))

Lab = rand(1, 3);
max(abs(Lab - XYZ2Lab(Lab2XYZ(Lab))))

max(abs(XYZ2Lab(XYZ) - xyz2lab(XYZ,'WhitePoint','d65')))
max(abs(Lab2XYZ(Lab) - lab2xyz(Lab,'WhitePoint','d65')))

max(abs(Lab - xyz2lab(lab2xyz(Lab,'WhitePoint','d65'),'WhitePoint','d65')))
max(abs(XYZ - lab2xyz(xyz2lab(XYZ,'WhitePoint','d65'),'WhitePoint','d65')))

D_65 = sum(linRGB_matrix^(-1), 2)';
max(abs(D_65 - whitepoint('d65')))