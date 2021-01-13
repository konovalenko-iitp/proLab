
function Cov = get_covariance(X)
    X = X - mean(X);
    Cov = X'*X/size(X,1);
end

