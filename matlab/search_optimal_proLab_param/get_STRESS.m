
%     "Measurement of the relationship ...
%     between perceived and computed
%     color differences", Formula (9).

function [STRESS, F] = get_STRESS(achi, goal)
    achi = achi(:);
    goal = goal(:);
    F = (achi'*goal) / (achi'*achi);
    STRESS = sqrt(sum((F*achi - goal).^2) / sum(goal.^2));
end

