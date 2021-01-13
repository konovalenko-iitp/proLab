
function XYZ = LMS2XYZ(LMS)
    XYZ = LMS * (LMS_matrix')^(-1);
end

