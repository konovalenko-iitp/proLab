
classdef CritDataBase < handle
    properties
        XYZ_Uni;
        XYZ_Het;
        distance_CIEDE2000;
    end
    methods
        function obj = CritDataBase(XYZ_Uni, XYZ_Het)
            obj.XYZ_Uni = XYZ_Uni;
            obj.XYZ_Het = XYZ_Het;
            obj.distance_CIEDE2000 = get_CIEDE2000(XYZ_Uni, 'CIE XYZ');
        end
        function value = get(obj, CS_name, x, criter_name)
            if size(x, 2) == 8
                param.m = x;
            else
                param = x;
            end
            
            switch criter_name
%                 case 'Uniformity_PCA'
%                     handle = color_dist(CS_name, param);
%                     CD = handle(obj.XYZ_uniform);
%                     value = get_STRESS(CD.^2, (obj.distance_CIEDE2000).^2);
                case 'Uniformity'
                    handle = color_dist(CS_name, param);
                    CD = handle(obj.XYZ_Uni);
                    value = get_STRESS(CD, obj.distance_CIEDE2000);
                case 'Homoscedasticity'
%                     sigma = get_sigma(obj.XYZ_noisy, CS_name, param);
                    sigma = get_sigma_linearization(obj.XYZ_Het, CS_name, param);
                    value = get_STRESS(sigma, ones(size(sigma)));
                case 'Mixed'
                    uniformity_part = 0.7;
                    handle = color_dist(CS_name, param);
                    CD = handle(obj.XYZ_Uni);
%                     sigma = get_sigma(obj.XYZ_Het, CS_name, param);
                    sigma = get_sigma_linearization(obj.XYZ_Het, CS_name, param);
                    value = ...
                        uniformity_part * get_STRESS(CD, obj.distance_CIEDE2000) + ...
                        (1-uniformity_part) * get_STRESS(sigma, ones(size(sigma)));
            end
            value = value + penalty(param);
        end
    end
end

