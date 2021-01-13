
function XYZ = get_sample(N, options)
    if nargin < 2
        options.check_camera_sane = false;
    end
    d_lambda = 30;
    XYZ = zeros(0, 3);
    while true
%         disp('   Iteration ...');
        Lab = [100 400 300] .* rand(3*N, 3) - [0 200 150];
%         if nargin == 2
%             CIEDE2000 = get_CIEDE2000(Lab, 'CIELAB');
%             idx_1 = (borders(1) <= CIEDE2000);
%             idx_2 = (CIEDE2000 <= borders(2));
%             idx = idx_1 & idx_2;
%             Lab{1} = Lab{1}(idx,:);
%             Lab{2} = Lab{2}(idx,:);
%         end
        XYZ_part = Lab2XYZ(Lab);
        idx = is_color_body(XYZ_part,d_lambda);
        XYZ_part = XYZ_part(idx, :);
        if options.check_camera_sane
            idx = is_camera_sane(XYZ_part);
            XYZ_part = XYZ_part(idx, :);
        end
        XYZ = [XYZ; XYZ_part];
        if size(XYZ, 1) >= 2*N
            break;
        end
    end
    XYZ(2*N+1:end,:) = [];
    XYZ = {XYZ(1:N,:), XYZ(N+1:2*N,:)};
end