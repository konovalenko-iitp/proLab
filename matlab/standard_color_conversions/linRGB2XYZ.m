
function XYZ = linRGB2XYZ(linRGB)
    XYZ = linRGB * (linRGB_matrix')^(-1);
end