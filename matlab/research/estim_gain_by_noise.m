
function [gain, M, C] = estim_gain_by_noise(cc)
    M = (mean(cc));
    C = diag(cov(cc))';
    gain =  C./M; % !!!!!!!
    C = diag(get_covariance(cc))'; % !!!!!!!
end

