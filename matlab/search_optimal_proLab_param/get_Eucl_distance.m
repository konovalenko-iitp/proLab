
function space_distance = get_Eucl_distance(XYZ_transform, XYZ)
    XYZ_transformed = XYZ_transform(XYZ);
    diff_XYZ_transformed = XYZ_transformed{1}-XYZ_transformed{2};
    space_distance = sqrt(sum(diff_XYZ_transformed.^2, 2));
end