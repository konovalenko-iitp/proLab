
function sRGB = linRGB2sRGB(linRGB)
    sRGB = zeros(size(linRGB));
    a = 0.055;
    C = 0.0031308;
    k = 12.92;
    p = 1 / 2.4;
    
    abs_sRGB_linear = abs(linRGB);
    ind = (abs_sRGB_linear > C);
    sRGB(~ind) = k*abs_sRGB_linear(~ind);
    sRGB(ind) = (1+a)*abs_sRGB_linear(ind).^p - a;
    sRGB = sign(linRGB).*sRGB;
end