
function matrix = deviceRGB_matrix
    matrix = (deviceRGB2linRGB_matrix)^(-1) * linRGB_matrix;
end
