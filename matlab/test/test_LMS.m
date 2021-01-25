
clc;
clear;
close all;

addpath(genpath('..'));

%% Invertibility test

sizes = {...
    [1, 3], ... % one color
    [5, 3] ... % vector of colors
    };
max_err = 0;
for i = 1:size(sizes, 2)
    XYZ = rand(sizes{i});
    LMS = rand(sizes{i});
    err = zeros(1,2);
    err(1) = compare_data( XYZ, LMS2XYZ( XYZ2LMS(XYZ)));
    err(2) = compare_data( LMS, XYZ2LMS( LMS2XYZ(LMS)));
    err = max(max(err));
    max_err = max(err, max_err);
end
max_err % should be ~zero