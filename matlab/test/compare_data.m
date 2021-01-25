
function err = compare_data(A, B)
    if iscell(A)
        err = max(max(max(abs([A{1}; A{2}] - [B{1}; B{2}]))));
    else
        err = max(max(max(abs(A - B))));
    end
end