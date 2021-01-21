
clc;
clear;

addpath(genpath(pwd));

sizes = {...
    [1, 3], ... % one color
    [10, 3], ... % vector of colors
    [10, 10, 3] ... % matrix of colors (image)
    };
for i = 1:size(sizes, 2)
    XYZ = rand(sizes{i});
    err = max(max(max(abs(XYZ - proLab2XYZ(XYZ2proLab(XYZ))))));
    err
    proLab = rand(sizes{i});
    err = max(max(max(abs(proLab - XYZ2proLab(proLab2XYZ(proLab))))));
    err
end

sRGB = vertex
XYZ = sRGB2XYZ(sRGB)
proLab = XYZ2proLab(XYZ)




