
function XYZ = xyY2XYZ(xyY)
    if iscell(xyY)
        XYZ = cell(1, 2);
        for i = 1:2
            XYZ{i} = transf(xyY{i});
        end
    else
        XYZ = transf(xyY);
    end
end

function XYZ = transf(xyY)
    XYZ = zeros(size(xyY));
    XYZ(:, 1) = (xyY(:, 3) ./ xyY(:, 2)) .* xyY(:, 1);
    XYZ(:, 2) = xyY(:, 3);
    XYZ(:, 3) = (xyY(:, 3) ./ xyY(:, 2)) .* (1 - xyY(:, 1) - xyY(:, 2));
end