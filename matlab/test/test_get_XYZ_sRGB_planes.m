
clc;
clear;

addpath(genpath('..'));
   
XYZ_sRGB_planes = get_XYZ_sRGB_planes()
XYZ_sRGB_vertex = (linRGB_matrix^(-1)*vertex')';
homogen_XYZ_sRGB_vertex = [XYZ_sRGB_vertex, ones(8, 1)]

XYZ_sRGB_planes * homogen_XYZ_sRGB_vertex'

