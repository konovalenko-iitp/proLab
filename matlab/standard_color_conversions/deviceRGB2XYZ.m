
function XYZ = deviceRGB2XYZ(deviceRGB)
    XYZ = deviceRGB * (deviceRGB_matrix')^(-1);
end

