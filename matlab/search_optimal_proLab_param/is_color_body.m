
function idx = is_color_body(XYZ, d_lambda)
    constraints = get_color_body_constraints(d_lambda);
    N = size(XYZ, 1);
    b = [XYZ, ones(N, 1)] * constraints' < 0;
    idx = all(b, 2);
end

