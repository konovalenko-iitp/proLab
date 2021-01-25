
clc;
clear;

addpath(genpath('..'));

%% Invertibility test

sizes = {...
    [1, 3], ... % one color
    [5, 3] ... % vector of colors
    };
max_err = 0;
for i = 1:size(sizes, 2)
    for j = 1:2
        ref_illum = rand(1,3);
        if j == 1
            XYZ = rand(sizes{i});
            xyY = rand(sizes{i});
        elseif j == 2
            XYZ = {rand(sizes{i}), rand(sizes{i})};
            xyY = {rand(sizes{i}), rand(sizes{i})};
        end
        err = zeros(1,2);
        err(1) = compare_data( XYZ, xyY2XYZ( XYZ2xyY(XYZ)));
        err(2) = compare_data( xyY, XYZ2xyY( xyY2XYZ(xyY)));
        err = max(max(err));
        max_err = max(err, max_err);
    end
end
max_err % should be ~zero