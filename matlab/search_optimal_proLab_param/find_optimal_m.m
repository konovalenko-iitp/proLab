
function m_optimal = find_optimal_m(ObjectiveFunction)
    best_minimum = +Inf;
    m_init = [...
         2.1590, -1.7823, -0.0713,  2.0865,  0.2102,  0.7553,  3.8666,  1.6738; ...
         2.4089, -1.8582, -0.1487,  2.2070, -0.1002,  0.7808,  2.2124,  0.9633; ...
        -2.3580,  2.4150,  0.0872,  2.5877,  0.1380,  0.0758,  5.4585,  2.5247; ...
        -3.0756,  2.0115,  0.2698,  3.0838,  0.1181,  1.3477,  2.8796,  0.6876; ...
    ];
    multistart_number = 1;
    for i = 1:multistart_number
        if i <= size(m_init, 1)
            m = m_init(i, :);
        else
            m = m_init(1, :) + 10*randn(1, 8);
        end
        options = optimset('Display','iter','PlotFcns',@optimplotfval);
        options.MaxFunEvals = +Inf;
        options.MaxIter     = +Inf;
        m_opt = fminsearch(ObjectiveFunction,m,options);                    
        minimum = ObjectiveFunction(m_opt);
        if minimum < best_minimum
            best_minimum = minimum;
            m_optimal = m_opt;
        end
    end
    best_minimum
end


