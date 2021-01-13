
clc;
clear;

addpath(genpath('..'));

n = 20;
x = 10*rand(n,3);
y = 10*rand(n,3);
get_CIEDE2000({x y}, 'CIE XYZ') - get_CIEDE2000({y x}, 'CIE XYZ')





