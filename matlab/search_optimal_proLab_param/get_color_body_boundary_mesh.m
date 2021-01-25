
function boundary_mesh = get_color_body_boundary_mesh(d_lambda)
    cache_path = ['search_optimal_proLab_param/cache/color_body_boundary_mesh_',num2str(d_lambda),'.mat'];
    if exist(cache_path, 'file') == 0
        formulary = '1931_FULL';
        lambda = (300:d_lambda:830)';
        XYZ_spectrum = get_XYZ_spectrum(lambda, formulary);
        XYZ_spectrum = XYZ_spectrum / max(XYZ_spectrum(:, 2));
        source = XYZ_spectrum .* get_D65_spectrum(lambda);
        source = source ./ (sum(source(:, 2)) * d_lambda);

        step_1 = @(l,l1,l2) (l1<l)&(l<l2);
        step_2 = @(l,l1,l2) ~((l1<l)&(l<l2));
        n = size(lambda, 1);
        boundary_mesh = zeros(0, 3);
        XYZ_half = zeros((n-1)*n/2, 3);
        count = 0;
        for i1 = 1:n
            for i2 = (i1+1):n
                l1 = lambda(i1);
                l2 = lambda(i2);
                count = count + 1;
                XYZ_half(count, :) = sum(source.*step_1(lambda, l1, l2))*d_lambda;
            end
        end
        boundary_mesh = [boundary_mesh; XYZ_half];
        XYZ_half = zeros((n-1)*n/2, 3);
        count = 0;
        for i1 = 1:n
            for i2 = (i1+1):n
                l1 = lambda(i1);
                l2 = lambda(i2);
                count = count + 1;
                XYZ_half(count, :) = sum(source.*step_2(lambda, l1, l2))*d_lambda;
            end
        end
        boundary_mesh = [boundary_mesh; XYZ_half];
        save(cache_path, 'boundary_mesh');
    else
        load(cache_path);
    end
end


