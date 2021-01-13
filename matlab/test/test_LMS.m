
clc;
clear;
close all;

addpath(genpath('..'));

n = 5;
XYZ = 10*rand(n, 3)-5;
LMS = 10*rand(n, 3)-5;

XYZ - LMS2XYZ(XYZ2LMS(XYZ))
LMS - XYZ2LMS(LMS2XYZ(LMS))