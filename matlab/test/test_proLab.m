
clc;
clear;

addpath(genpath('..'));

%% Invertibility test

sizes = {...
    [1, 3], ... % one color
    [5, 3], ... % vector of colors
    [5, 5, 3] ... % matrix of colors (image)
    };
max_err = 0;
for i = 1:size(sizes, 2)
    for j = 1:2
        ref_illum = rand(1,3);
        param.Q = rand(4,4);
        if j == 1
            XYZ = rand(sizes{i});
            proLab = rand(sizes{i});
        elseif j == 2
            XYZ = {rand(sizes{i}), rand(sizes{i})};
            proLab = {rand(sizes{i}), rand(sizes{i})};
        end
        err = zeros(2,3);
        err(1,1) = compare_data( XYZ,    proLab2XYZ( XYZ2proLab(XYZ)));
        err(1,2) = compare_data( XYZ,    proLab2XYZ( XYZ2proLab(XYZ,    ref_illum), ref_illum));
        err(1,3) = compare_data( XYZ,    proLab2XYZ( XYZ2proLab(XYZ,    ref_illum,  param), ref_illum, param));
        err(2,1) = compare_data( proLab, XYZ2proLab( proLab2XYZ(proLab)));
        err(2,2) = compare_data( proLab, XYZ2proLab( proLab2XYZ(proLab, ref_illum), ref_illum));
        err(2,3) = compare_data( proLab, XYZ2proLab( proLab2XYZ(proLab, ref_illum,  param), ref_illum, param));
        err = max(max(err));
        max_err = max(err, max_err);
    end
end
max_err % should be ~zero

