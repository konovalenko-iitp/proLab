
function linRGB = sRGB2linRGB(sRGB)
    linRGB = zeros(size(sRGB));
    a = 0.055;
    C = 0.0031308;
    k = 12.92;
    p = 2.4;
    
    abs_sRGB = abs(sRGB);
    ind = (abs_sRGB > k*C);
    linRGB(~ind) = (1/k)*abs_sRGB(~ind);
    linRGB(ind) = ((abs_sRGB(ind)+a)/(1+a)).^p;
    linRGB = sign(sRGB).*linRGB;
end
