
function proLab = XYZ2proLab(XYZ, ref_illum)
    if nargin == 1
        ref_illum = reference_illuminant;
    end
    param = proLab_param;
    proLab = XYZ2proLab_model(XYZ, ref_illum, param);
end

