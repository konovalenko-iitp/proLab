
function XYZ = simulate_camera_noise(local_size, global_size, XYZ_set)
    CS = color_spaces_collection('deviceRGB');
    if nargin == 2
        options.check_camera_sane = true;
        XYZ_set = get_sample(global_size, options);
        XYZ_set = XYZ_set{1};
    end
    CC = CS.transform_into(XYZ_set);
%     CC_white = CS.transform_into(D65');
    [gain, var_0] = sensor_noize_param;
    XYZ = zeros(global_size, local_size, 3);
    for g = 1:global_size
        mean_N = CC(g, :) / gain;
        mean_N = [mean_N(1:2), mean_N(2:3)];
        model = 'Normal_approx';
        N = get_quantum_noise(mean_N, local_size, model);
        N = max(0, N);
        CC_4 = gain * N + sqrt(var_0) * randn(size(N));
        CC_sample = [CC_4(:, 1), mean(CC_4(:, 2:3), 2), CC_4(:, 4)];
        XYZ(g, :, :) = CS.transform_from(CC_sample);
    end
%     XYZ = max(0, XYZ); % !!!
end