
function delta_E = get_CIEDE2000(CC, CS)
    switch CS
        case 'CIELAB'
            delta_E = (deltaE2000(CC{1},CC{2}))';
        case 'CIE XYZ'
            Lab = XYZ2Lab(CC);
            delta_E = (deltaE2000(Lab{1},Lab{2}))';
    end
end
    