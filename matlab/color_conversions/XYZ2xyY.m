
function xyY = XYZ2xyY(XYZ)
    if iscell(XYZ)
        xyY = cell(1, 2);
        for i = 1:2
            xyY{i} = transf(XYZ{i});
        end
    else
        xyY = transf(XYZ);
    end
end

function xyY = transf(XYZ)
    xyY = zeros(size(XYZ));
    xyY(:, 1) = XYZ(:, 1) ./ sum(XYZ, 2);
    xyY(:, 2) = XYZ(:, 2) ./ sum(XYZ, 2);
    xyY(:, 3) = XYZ(:, 2);
end