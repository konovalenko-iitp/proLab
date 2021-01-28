
function Sigma = get_sigma_linearization(XYZ, CS_name, param)
    CS_own = color_spaces_collection('deviceRGB');
    CC_own = CS_own.transform_into(XYZ);
    CC_own_max = CS_own.transform_into(reference_illuminant);
    
    [gain, var_0] = sensor_noize_param;
    
    g = size(CC_own, 1);
    dCC_own = zeros(g, 3, 2, 3);
    h = norm(CC_own_max)*10^(-8);
    for j = 1:3
        cc1 = CC_own;
        cc2 = CC_own;
        cc1(:, j) = cc1(:, j) - h;
        cc2(:, j) = cc2(:, j) + h;
        dCC_own(:, j, 1, :) = cc1;
        dCC_own(:, j, 2, :) = cc2;
    end
    dCC_own = reshape(dCC_own, [6 * g, 3]);
    dXYZ = CS_own.transform_from(dCC_own);
    CS = color_spaces_collection(CS_name, param);
    dCC = CS.transform_into(dXYZ);
    CC = reshape(dCC, [g, 3, 2, 3]);
    Sigma = zeros(g, 3);
    CC_deriv = (CC(:, :, 2, :) - CC(:, :, 1, :)) / (2 * h);
    CC_deriv = permute(CC_deriv, [4 2 1 3]);
    for i = 1:g
        J = CC_deriv(:, :, i);
        Cov_CC_own = [1 0 0; 0 1/2 0; 0 0 1] * diag(gain .* CC_own(i, :) + var_0);
        Cov_CC = J * Cov_CC_own * J';
        lambda = max(0, eig(Cov_CC));
        Sigma(i, :) = sort(sqrt(lambda));
    end
end

% function Sigma = get_sigma_linearization(XYZ, CS_name, param, gain)
%   
%     CS_own = color_spaces_collection('hwRGB', param);
%     CC_own = CS_own.transform_into(XYZ);
%     CC_own_max = CS_own.transform_into(D65');
%     
%     g = size(CC_own, 1);
%     dCC_own = zeros(g, 3, 2, 3);
%     h = norm(CC_own_max)*10^(-8);
%     for j = 1:3
%         cc1 = CC_own;
%         cc2 = CC_own;
%         cc1(:, j) = cc1(:, j) - h;
%         cc2(:, j) = cc2(:, j) + h;
%         dCC_own(:, j, 1, :) = cc1;
%         dCC_own(:, j, 2, :) = cc2;
%     end
%     dCC_own = reshape(dCC_own, [6 * g, 3]);
%     dXYZ = CS_own.transform_from(dCC_own);
%     CS = color_spaces_collection(CS_name, param);
%     dCC = CS.transform_into(dXYZ);
%     CC = reshape(dCC, [g, 3, 2, 3]);
%     Sigma = zeros(g, 3);
%     CC_deriv = (CC(:, :, 2, :) - CC(:, :, 1, :)) / (2 * h);
%     CC_deriv = permute(CC_deriv, [4 2 1 3]);
%     for i = 1:g
%         J = CC_deriv(:, :, i);
%         Cov_CC_own = diag(CC_own_max .* abs(CC_own(i, :)) ./ gain);
%         Cov_CC = J * Cov_CC_own * J';
%         lambda = max(0, eig(Cov_CC));
%         Sigma(i, :) = sort(sqrt(lambda));
%     end
% end