
function CAM16UCS = XYZ2CAM16UCS(XYZ, ref_illum)
    if nargin == 1
        ref_illum = reference_illuminant;
    end
    if iscell(XYZ)
        CAM16UCS = cell(1, 2);
        for i = 1:2
            CAM16UCS{i} = transf(XYZ{i}, ref_illum);
        end
    else
        CAM16UCS = transf(XYZ, ref_illum);
    end
end

function CAM16UCS = transf(XYZ, ref_illum)
    save('../python/reference_illuminant.mat', 'ref_illum');
    save('../python/request.mat', 'XYZ');
    system('python ../python/XYZ_to_CAM16UCS.py');
    response = load('../python/response.mat');
    CAM16UCS = response.CAM16UCS;
end