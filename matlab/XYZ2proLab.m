
function proLab = XYZ2proLab(XYZ, ref_illum, param)
    if nargin < 2
        ref_illum = reference_illuminant;
    end
    if nargin < 3
        param = proLab_param;
    end
    if iscell(XYZ)
        proLab = cell(1, 2);
        for i = 1:2
            proLab{i} = f(XYZ{i}, ref_illum, param);
        end
    else
        proLab = f(XYZ, ref_illum, param);
    end
end

function proLab = f(XYZ, ref_illum, param)
    isImage = false;
    if size(size(XYZ), 2) == 3
        [s1, s2, s3] = size(XYZ);
        XYZ = reshape(XYZ, [s1*s2, s3]);
        isImage = true;
    end
    XYZ = XYZ ./ ref_illum;
    if isfield(param, 'Q')
        proLab = projTrans3D(XYZ, param.Q);
    else 
        M = m2M(param.m);
        proLab = projTrans3D(XYZ, M);
    end
    if isImage
        proLab = reshape(proLab, [s1, s2, s3]);
    end
end