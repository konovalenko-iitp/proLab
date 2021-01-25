
clc;
clear;

addpath(genpath('..'));

XYZ = rand(1, 3);
Lab = rand(1, 3);

max(abs(XYZ2Lab(XYZ) - xyz2lab(XYZ,'WhitePoint','d65')))
max(abs(Lab2XYZ(Lab) - lab2xyz(Lab,'WhitePoint','d65')))

max(abs(Lab - xyz2lab(lab2xyz(Lab,'WhitePoint','d65'),'WhitePoint','d65')))
max(abs(XYZ - lab2xyz(xyz2lab(XYZ,'WhitePoint','d65'),'WhitePoint','d65')))

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
            Lab = rand(sizes{i});
        elseif j == 2
            XYZ = {rand(sizes{i}), rand(sizes{i})};
            Lab = {rand(sizes{i}), rand(sizes{i})};
        end
        err = zeros(2,2);
        err(1,1) = compare_data( XYZ, Lab2XYZ( XYZ2Lab(XYZ)));
        err(1,2) = compare_data( XYZ, Lab2XYZ( XYZ2Lab(XYZ, ref_illum), ref_illum));
        err(2,1) = compare_data( Lab, XYZ2Lab( Lab2XYZ(Lab)));
        err(2,2) = compare_data( Lab, XYZ2Lab( Lab2XYZ(Lab, ref_illum), ref_illum));
        err = max(max(err));
        max_err = max(err, max_err);
    end
end
max_err % should be ~zero