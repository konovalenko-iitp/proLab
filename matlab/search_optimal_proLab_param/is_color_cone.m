
function idx = is_color_cone(X)
    lambda = [361; (400:1:690)'; 700];
    formulary = '1931_FULL';
    XYZ = get_XYZ_spectrum(lambda, formulary);
    S = sum(XYZ, 2);
    x = XYZ(:,1) ./ S;
    y = XYZ(:,2) ./ S;

    y1 = y;
    y2 = y(2: end);
    y2 = [y2; y(1)];

    x1 = x;
    x2 = x(2: end);
    x2 = [x2; x(1)];

    A = y1-y2;
    B = x2-x1;
    C = x1.*y2 - x2.*y1;
    if size(X, 2) == 3
        X = X(:, 1:2) ./ sum(X, 2);
    end
    idx = false(size(X, 1), 1);
    for i = 1:size(X, 1)
        if size(A, 1) == -sum(sign(A*X(i, 1) + B*X(i, 2) + C))
            idx(i) = 1;
        end
    end
end