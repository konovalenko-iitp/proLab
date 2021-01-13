
function [Sigma, Mean] = get_sigma(XYZ, CS_name, param)

    CS = color_spaces_collection(CS_name, param);
    [g, sample_size, ~] = size(XYZ);
    XYZ = reshape(XYZ, [g * sample_size, 3]);
    CC = CS.transform_into(XYZ);
    CC = reshape(CC, [g, sample_size, 3]);
    Mean = zeros(g, 3);
    Sigma = zeros(g, 3);
    for i = 1:g
        CC_sample = squeeze(CC(i, :, :));
        Mean(i, :) = mean(CC_sample);
        Cov = get_covariance(CC_sample);
        lambda = max(0, eig(Cov));
        Sigma(i, :) = sort(sqrt(lambda));
%         Sigma(i, :) = sort(lambda);
    end
end