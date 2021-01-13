
% https://en.wikipedia.org/wiki/Penalty_method

function g = penalty(param)

    m = param.m;
    M = m2M(m);
    
    c1 = - m(1) * m(4);
    
    linRGB = vertex;
    c2 = - (linRGB(2:end, :) * (m(6:8))' + 1);
    
    mm0 = [m(1)+m(2)+m(3); m(4)+m(5); 1];
    m0 = m(6)+m(7)+m(8)+1;
    l = [m0*mm0', 0; m0*mm0', - mm0'*mm0];
    CIEXYZ_normal = l * M(:, 1:3);    
    c3 = - CIEXYZ_normal;
    c3 = c3(:);
    
    c = [c1; c2; c3];
    g = 100*sum((max(0,c)).^1); % !!!
    
end