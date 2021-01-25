
function XYZ = proLab2XYZ(proLab, ref_illum, param)
    if nargin < 2
        ref_illum = reference_illuminant;
    end
    if nargin < 3
        param = proLab_param;
    end
    if iscell(proLab)
        XYZ = cell(1, 2);
        for i = 1:2
            XYZ{i} = f_reverse(proLab{i}, ref_illum, param);
        end
    else
        XYZ = f_reverse(proLab, ref_illum, param);
    end
end

function XYZ = f_reverse(proLab, ref_illum, param)  
    isImage = false;
    if size(size(proLab), 2) == 3
        [s1, s2, s3] = size(proLab);
        proLab = reshape(proLab, [s1*s2, s3]);
        isImage = true;
    end
    if isfield(param, 'Q')
        XYZ = projTrans3D(proLab, param.Q^(-1));
    else 
        M = m2M(param.m);
        XYZ = projTrans3D(proLab, M^(-1));
    end
    XYZ = XYZ .* ref_illum;
    if isImage
        XYZ = reshape(XYZ, [s1, s2, s3]);
    end
end