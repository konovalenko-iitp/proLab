
clc;
clear;
close all;

addpath(genpath(pwd));

%% set criterion

criter_name = 'Uniformity';
% criter_name = 'Homoscedasticity';
% criter_name = 'Mixed';

sample_size.Train.Uniformity = 10000;
sample_size.Train.Homoscedasticity = 100;
sample_size.Test.Uniformity = 10000;
sample_size.Test.Homoscedasticity = 10000;

%% train

XYZ_Uni = get_sample(sample_size.Train.Uniformity);
options.check_camera_sane = true;
XYZ_Het = get_sample(sample_size.Train.Homoscedasticity, options);
XYZ_Het = XYZ_Het{1,1};
CDB_train = CritDataBase(XYZ_Uni, XYZ_Het);

disp('Train ...');
ObjFunc = @(m) CDB_train.get('proLab', m, criter_name);
param.m = find_optimal_m(ObjFunc);
param.Q = m2Q(param);
m = param.m
Q = param.Q
clear m Q
% param = proLab_param;

%% test

XYZ_Uni = get_sample(sample_size.Test.Uniformity);
options.check_camera_sane = true;
XYZ_Het = get_sample(sample_size.Test.Homoscedasticity, options);
XYZ_Het = XYZ_Het{1,1};
CDB_test = CritDataBase(XYZ_Uni, XYZ_Het);

disp('TEST ...');
criterion_report(CDB_test, 'Uniformity', param);
criterion_report(CDB_test, 'Homoscedasticity', param);

plot_sRGB_gamut(param);


