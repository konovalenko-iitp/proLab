
function plot_cube(X, color)

    plot3([X(1, 1) X(2, 1)], [X(1, 2) X(2, 2)], [X(1, 3) X(2, 3)], 'color', color);
    plot3([X(1, 1) X(3, 1)], [X(1, 2) X(3, 2)], [X(1, 3) X(3, 3)], 'color', color);
    plot3([X(1, 1) X(4, 1)], [X(1, 2) X(4, 2)], [X(1, 3) X(4, 3)], 'color', color);
    
    plot3([X(5, 1) X(8, 1)], [X(5, 2) X(8, 2)], [X(5, 3) X(8, 3)], 'color', color);
    plot3([X(6, 1) X(8, 1)], [X(6, 2) X(8, 2)], [X(6, 3) X(8, 3)], 'color', color);
    plot3([X(7, 1) X(8, 1)], [X(7, 2) X(8, 2)], [X(7, 3) X(8, 3)], 'color', color);
    
    plot3([X(2, 1) X(7, 1)], [X(2, 2) X(7, 2)], [X(2, 3) X(7, 3)], 'color', color);
    plot3([X(7, 1) X(3, 1)], [X(7, 2) X(3, 2)], [X(7, 3) X(3, 3)], 'color', color);
    plot3([X(3, 1) X(5, 1)], [X(3, 2) X(5, 2)], [X(3, 3) X(5, 3)], 'color', color);
    plot3([X(5, 1) X(4, 1)], [X(5, 2) X(4, 2)], [X(5, 3) X(4, 3)], 'color', color);
    plot3([X(4, 1) X(6, 1)], [X(4, 2) X(6, 2)], [X(4, 3) X(6, 3)], 'color', color);
    plot3([X(6, 1) X(2, 1)], [X(6, 2) X(2, 2)], [X(6, 3) X(2, 3)], 'color', color);
    
end

