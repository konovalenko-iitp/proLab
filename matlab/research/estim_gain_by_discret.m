
function gain = estim_gain_by_discret(cc)

    color = {'.r', '.g', '.g', '.b'};
    gain = zeros(size(color, 2),1);
    figure();
    hold on;
    for i = 1:size(gain, 1)
        Y = unique(sort(cc(:, i)));
        X = (1:size(Y,1))';
        plot(X,Y,color{i});
        h = 10;
        X = X(h:end-h);
        Y = Y(h:end-h);
        gain(i) = (Y(end)-Y(1)) / (size(Y,1)-1);
    end
end

