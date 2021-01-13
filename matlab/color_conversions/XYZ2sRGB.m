
function sRGB = XYZ2sRGB(XYZ)
    if iscell(XYZ)
        sRGB = cell(1, 2);
        for i = 1:2
            sRGB{i} = transf(XYZ{i});
        end
    else
        sRGB = transf(XYZ);
    end
end

function sRGB = transf(XYZ)
    linRGB = XYZ2linRGB(XYZ);
    sRGB = linRGB2sRGB(linRGB);
end