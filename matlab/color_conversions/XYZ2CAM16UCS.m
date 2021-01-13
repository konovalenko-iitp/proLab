
function CAM16UCS = XYZ2CAM16UCS(XYZ)
    if iscell(XYZ)
        CAM16UCS = cell(1, 2);
        for i = 1:2
            CAM16UCS{i} = transf(XYZ{i});
        end
    else
        CAM16UCS = transf(XYZ);
    end
end

function CAM16UCS = transf(XYZ)
    ref_ill = reference_illuminant;
    save('../python/reference_illuminant.mat', 'ref_ill');
    save('../python/request.mat', 'XYZ');
    system('python ../python/XYZ_to_CAM16UCS.py');
    response = load('../python/response.mat');
    CAM16UCS = response.CAM16UCS;
end