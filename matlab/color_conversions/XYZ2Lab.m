
function Lab = XYZ2Lab(XYZ)
    if iscell(XYZ)
        Lab = cell(1, 2);
        for i = 1:2
            Lab{i} = transf(XYZ{i});
        end
    else
        Lab = transf(XYZ);
    end
end

function Lab = transf(XYZ)
    XYZ = XYZ ./ reference_illuminant;
    Lab = [116 *  f(XYZ(:, 2)) - 16, ...
           500 * (f(XYZ(:, 1)) - f(XYZ(:, 2))), ...
           200 * (f(XYZ(:, 2)) - f(XYZ(:, 3)))];
end

function ret_val = f(t)
    delta = 6/29;
    logic = t > delta^3;
    ret_val = zeros(size(t));
    ret_val(~logic) = t(~logic) / (3 * delta^2) + 4/29;
    ret_val(logic) = t(logic).^(1/3);
end