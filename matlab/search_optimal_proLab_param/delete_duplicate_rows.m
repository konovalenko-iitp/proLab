
% This function does not guarantee removal of ALL identical rows!!!

function X = delete_duplicate_rows(X)
%     X = [1 2 3 4; 2 3 4 5; 3 4 5 6; 4 5 6 7; 5 6 7 8; 2 3 4 5; 6 7 8 9]
    n = size(X,1);
    S = sum(X,2);
    [S, idx] = sort(S);
    for i = 2:n
        if S(i-1)==S(i)
            if norm(X(idx(i-1)) - X(idx(i)))==0
                X(idx(i-1), :) = NaN;
            end
        end 
    end
    X = X(~isnan(X(:, 1)),:);
end