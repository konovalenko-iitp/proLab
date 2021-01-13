
function plot_sigma(x, y_l, y_u, h, w)
    plot([x-(h/2), x+(h/2)],[y_l, y_l],'r','LineWidth',w);
    plot([x, x],[y_l, y_u],'r','LineWidth',w);
    plot([x-(h/2), x+(h/2)],[y_u, y_u],'r','LineWidth',w);
end

