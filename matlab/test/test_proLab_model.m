
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
        err = zeros(2,1);
        err(1,1) = compare_data( XYZ,    proLab2XYZ_model( XYZ2proLab_model(XYZ,    ref_illum,  param), ref_illum, param));
        err(2,1) = compare_data( proLab, XYZ2proLab_model( proLab2XYZ_model(proLab, ref_illum,  param), ref_illum, param));
        err = max(max(err));
        max_err = max(err, max_err);
    end
end
max_err % should be ~zero

