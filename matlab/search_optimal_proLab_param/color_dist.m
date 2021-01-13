
function handle = color_dist(METHOD, param)
    if nargin == 1
        param = proLab_param;
    end
    switch METHOD
        case 'LMS'
            handle = @(XYZ) get_Eucl_distance(@XYZ2LMS, XYZ);
        case 'deviceRGB'
            handle = @(XYZ) get_Eucl_distance(@XYZ2deviceRGB, XYZ);
        case 'CIE XYZ'
            handle = @(XYZ) get_Eucl_distance(@XYZ2XYZ, XYZ);
        case 'CIE xyY'
            handle = @(XYZ) get_Eucl_distance(@XYZ2xyY, XYZ);
        case 'linRGB'
            handle = @(XYZ) get_Eucl_distance(@XYZ2linRGB, XYZ);
        case 'sRGB'
            handle = @(XYZ) get_Eucl_distance(@XYZ2sRGB, XYZ);
        case 'CIELAB'
            handle = @(XYZ) get_Eucl_distance(@XYZ2Lab, XYZ);
        case 'proLab'
            handle = @(XYZ) get_Eucl_distance(@(XYZ)XYZ2proLab(XYZ, param), XYZ);
        case 'CAM16-UCS'
            handle = @(XYZ) get_Eucl_distance(@XYZ2CAM16UCS, XYZ);
        case 'CAM16-UCS^p'
            handle = @(XYZ) 1.41 * (get_Eucl_distance(@XYZ2CAM16UCS, XYZ)).^(0.63);
        case 'CIEDE2000'
            handle = @(XYZ) get_CIEDE2000(XYZ, 'XYZ');
    end
end

