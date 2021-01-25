
function Lab = XYZ2Lab(XYZ, ref_illum)
    if nargin == 1
        ref_illum = reference_illuminant;
    end
    if iscell(XYZ)
        Lab = cell(1, 2);
        for i = 1:2
            Lab{i} = transf(XYZ{i}, ref_illum);
        end
    else
        Lab = transf(XYZ, ref_illum);
    end
end

function Lab = transf(XYZ, ref_illum)
    XYZ = XYZ ./ ref_illum;
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