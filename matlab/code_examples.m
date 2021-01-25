
clc;
clear;

addpath(genpath(pwd));

%% Examples of using XYZ2proLab and proLab2XYZ

sizes = {...
    [1, 3], ... % one color
    [5, 3], ... % vector of colors
    [5, 5, 3] ... % matrix of colors (image)
    }
for i = 1:size(sizes, 2)
    for j = 1:2
        if j == 1
            XYZ = rand(sizes{i});
        elseif j == 2
            XYZ = {rand(sizes{i}), rand(sizes{i})};
        end
        XYZ
        ref_illum = rand(1,3)
        param.Q = rand(4,4)

        proLab = XYZ2proLab(XYZ)
        proLab = XYZ2proLab(XYZ, ref_illum)
        proLab = XYZ2proLab(XYZ, ref_illum, param)

        XYZ = proLab2XYZ(proLab)
        XYZ = proLab2XYZ(proLab, ref_illum)
        XYZ = proLab2XYZ(proLab, ref_illum, param)
    end
end