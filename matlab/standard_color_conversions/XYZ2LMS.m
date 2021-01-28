
function LMS = XYZ2LMS(XYZ)
    if iscell(XYZ)
        LMS = cell(1, 2);
        for i = 1:2
            LMS{i} = transf(XYZ{i});
        end
    else
        LMS = transf(XYZ);
    end
end

function LMS = transf(XYZ)
    LMS = XYZ * LMS_matrix';
end