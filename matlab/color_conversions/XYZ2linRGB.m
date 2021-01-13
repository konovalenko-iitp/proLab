
function linRGB = XYZ2linRGB(XYZ)
    if iscell(XYZ)
        linRGB = cell(1, 2);
        for i = 1:2
            linRGB{i} = transf(XYZ{i});
        end
    else
        linRGB = transf(XYZ);
    end
end

function linRGB = transf(XYZ)
    linRGB = XYZ * linRGB_matrix';
end

