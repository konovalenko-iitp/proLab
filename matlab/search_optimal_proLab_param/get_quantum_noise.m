
function N = get_quantum_noise(mean_N, local_size, model)
    c = size(mean_N, 2);
    switch model
        case 'Poisson'
            N = zeros(local_size, c);
            for i = 1:c
                N(:, i) = poissrnd(mean_N(i), [local_size 1]);
            end
        case 'Normal_approx'
            N = mean_N + sqrt(mean_N) .* randn(local_size, c);
    end
end

