
function deviceRGB = XYZ2deviceRGB(XYZ)
    if iscell(XYZ)
        deviceRGB = cell(1, 2);
        for i = 1:2
            deviceRGB{i} = transf(XYZ{i});
        end
    else
        deviceRGB = transf(XYZ);
    end
end

function deviceRGB = transf(XYZ)
    deviceRGB = XYZ * deviceRGB_matrix';
end
