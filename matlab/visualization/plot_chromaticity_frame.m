
clc;
clear;
close all;

addpath(genpath('..'));

CS_list = {'CIE XYZ'; 'CIE xyY'; 'sRGB'; 'CIELAB'; 'proLab'};
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
    AO = CS.axis_Lab_order;
    switch CS.name
        case 'sRGB'
            L = 0.5;
            xl = [-0.25 1.25];
            yl = [-0.25 1.25];
        case 'CIE XYZ'
            L = 0.5;
            xl = [0 1];
            yl = [0 1];
        case 'CIE xyY'
            L = 0.5;
            xl = [0.1 0.55];
            yl = [0.2 0.65];
        case 'CIELAB'
            L = 75;
            xl = [-100 75];
            yl = [-50 100];
        case 'proLab'
            L = 75;
            xl = [-50 50];
            yl = [-40 40];
    end
    dt = (xl(2)-xl(1)) / 100;
    nx = fix((xl(2)-xl(1))/dt);
    ny = fix((yl(2)-yl(1))/dt);
    pic = ones(ny,nx,3);
    AlphaData = zeros(ny,nx);
    for j = 1:nx
        for i = 1:ny
            A = j*dt + xl(1);
            B = i*dt + yl(1);
            CC_disordered = [L A B];
            CC = CC_disordered;
            for k = 1:3
                CC(abs(AO(k))) = CC_disordered(k);
            end
            if strcmp(CS.name, 'sRGB')
                linRGB = sRGB2linRGB(CC);
            else
                XYZ = CS.transform_from(CC);
                linRGB = XYZ2linRGB(XYZ); 
            end
            if 0 <= min(linRGB) && max(linRGB) <= 1%+Inf
                sRGB = linRGB2sRGB(linRGB);
%                 sRGB_max = sRGB / max(sRGB);
                pic(i,j,:) = sRGB;
                AlphaData(i,j) = 1;
            end
        end
    end
    fig = figure(CS_num);
    hold on;
    grid on;
    image(xl, yl, pic, 'AlphaData', AlphaData);
    set(gca,'FontSize',15);
    FontSize = 20;
    if strcmp(CS.name, 'CIExyY')
        plot_lazer_triangle('CIExyY', 0.5);
    end
    title([CS.name, ' (',CS.axis_names{abs(AO(1))},'=',num2str(L), ...
        '), showing only colors that', newline, ...
        'can be displayed on a typical (sRGB) display'], ...
        'Interpreter','latex', 'FontSize', FontSize);
    xlabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
    ylabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
    if AO(2) < 0
        set(gca,'XDir', 'reverse');
    end
    if AO(3) < 0
        set(gca,'YDir', 'reverse');
    end
    axis equal;
    saveas(fig,['images/chromaticity/', CS.name, '.png']);
end


