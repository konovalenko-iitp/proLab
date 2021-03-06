
function XYZ = Lab2XYZ(Lab, ref_illum)
    if nargin == 1
        ref_illum = reference_illuminant;
    end
    if iscell(Lab)
        XYZ = cell(1, 2);
        for i = 1:2
            XYZ{i} = transf(Lab{i}, ref_illum);
        end
    else
        XYZ = transf(Lab, ref_illum);
    end
end

function XYZ = transf(Lab, ref_illum)
    f_y = (Lab(:, 1) + 16) / 116;
    f_x = f_y + Lab(:, 2) / 500;
    f_z = f_y - Lab(:, 3) / 200;
    XYZ = [f_reverse(f_x), f_reverse(f_y), f_reverse(f_z)];
    XYZ = ref_illum .* XYZ;
end

function ret_val = f_reverse(t)
    delta = 6/29;
    logic = t > delta;
    ret_val = zeros(size(t));
    ret_val(logic) = t(logic).^3;
    ret_val(~logic) = 3 * delta^2 * (t(~logic) - 16/116);
end

