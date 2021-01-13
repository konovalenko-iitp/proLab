
function proLab = XYZ2proLab(XYZ, param)
    if nargin == 1
        param = proLab_param;
    end
    if iscell(XYZ)
        proLab = cell(1, 2);
        for i = 1:2
            proLab{i} = f(XYZ{i}, param);
        end
    else
        proLab = f(XYZ, param);
    end
end

function proLab = f(XYZ, param)
    isImage = false;
    if size(size(XYZ), 2) == 3
        [s1, s2, s3] = size(XYZ);
        XYZ = reshape(XYZ, [s1*s2, s3]);
        isImage = true;
    end
    XYZ = XYZ ./ reference_illuminant;
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