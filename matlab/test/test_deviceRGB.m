
clc;
clear;
close all;

addpath(genpath('..'));

n = 5;
XYZ = 10*rand(n, 3)-5;
hwRGB = 10*rand(n, 3)-5;

XYZ - deviceRGB2XYZ(XYZ2deviceRGB(XYZ))
hwRGB - XYZ2deviceRGB(deviceRGB2XYZ(hwRGB))