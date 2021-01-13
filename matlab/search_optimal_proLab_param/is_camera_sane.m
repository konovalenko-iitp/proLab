
function idx = is_camera_sane(XYZ)
    hwRGB = XYZ2deviceRGB(XYZ);
    idx = all(hwRGB>=0, 2);
end
