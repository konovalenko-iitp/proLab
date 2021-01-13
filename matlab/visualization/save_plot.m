
function save_plot(fig, fullname)

    saveas(fig, fullname);
    pic = imread(fullname);
    isWhite = sum(pic,3) == (255 * size(pic,3));
    XS = sum(isWhite,1) < size(pic, 1);
    YS = sum(isWhite,2) < size(pic, 2);
    pic = pic(YS, XS, :);
    imwrite(pic, fullname);

end

