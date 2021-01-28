
function XYZ = proLab2XYZ(proLab, ref_illum)
    if nargin == 1
        ref_illum = reference_illuminant;
    end
    param = proLab_param;
    XYZ = proLab2XYZ_model(proLab, ref_illum, param);
end

