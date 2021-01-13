
function proLab = projTrans3D(XYZ, proj_matrix)
    proLab_homog = [XYZ, ones(size(XYZ, 1), 1)] * proj_matrix';
    proLab = proLab_homog(:, 1:3) ./ proLab_homog(:, 4); 
end