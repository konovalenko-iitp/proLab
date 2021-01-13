
function [constraints, DT, C] = get_color_body_constraints(d_lambda) 
    cache_path = ['cache/color_body_constraints_',num2str(d_lambda),'.mat'];
    if exist(cache_path, 'file') == 0
        boundary_mesh = get_color_body_boundary_mesh(d_lambda);
        DT = delaunayTriangulation(boundary_mesh);
        [C,~] = convexHull(DT);
        center = [D65/2'; 1];
        M = size(C, 1);
        constraints = zeros(M, 4);
        for j = 1:M
            C(j, :);
            c1 = DT.Points(C(j, 1), :);
            c2 = DT.Points(C(j, 2), :);
            c3 = DT.Points(C(j, 3), :);
            normal = cross(c2-c1, c3-c1);
            normal = normal / norm(normal);
            constr = [normal, -c1*normal'];
            if constr*center > 0
                constr = - constr;
            end
            constraints(j, :) = constr;
        end
        constraints = delete_duplicate_rows(constraints);
        save(cache_path, 'constraints', 'DT', 'C');
    else
        load(cache_path);
    end
end


