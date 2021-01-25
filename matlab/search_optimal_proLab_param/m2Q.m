
function Q = m2Q(param)
    if isfield(param, 'Q')
        param = rmfield(param, 'Q');
    end
    param.Q = m2M(param.m);
    Lab_goal = [ 50, -80,   0; ...
                 50,  80,   0; ...
                 50,   0, -80; ...
                 50,   0,  80; ...
                100,   0,   0];        
    XYZ_points = Lab2XYZ(Lab_goal);
    proLab_points = XYZ2proLab(XYZ_points, reference_illuminant, param);
    k = norm(Lab_goal(end,:)) / norm(proLab_points(end,:));
    param.Q = [[k * eye(3, 3), [0; 0; 0]]; 0 0 0 1] * param.Q;
    
    proLab_points = XYZ2proLab(XYZ_points, reference_illuminant, param);
    white_direct = Lab_goal(end, :) / norm(Lab_goal(end, :));
    K = proLab_points(end, :)' * white_direct;
    try
        R = K2R(K);
    catch
        R = eye(3,3);
    end
    param.Q = [[R, [0; 0; 0]]; 0 0 0 1] * param.Q;
    proLab_points = XYZ2proLab(XYZ_points, reference_illuminant, param);
    X = proLab_points * (eye(3,3) - white_direct' * white_direct);
    Y =    Lab_goal   * (eye(3,3) - white_direct' * white_direct);
    K = X' * Y;
    try
        R = K2R(K);
    catch
        R = eye(3,3);
    end
    Q = [[R, [0; 0; 0]]; 0 0 0 1] * param.Q;
end

function R = K2R(K)
    [U,~,V] = svd(K);
    R = V*U';
    if det(R)<0
        V(:,3)=-V(:,3);
        R = V*U';
    end
end

