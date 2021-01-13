
clc;
clear;
close all;

addpath(genpath('..'));

CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
%     CS_list = {'proLab'};

d_lambda = 10; % 2

%     XYZ = get_color_body_boundary_mesh(d_lambda);
[~, DT, CL] = get_color_body_constraints(d_lambda);
XYZ = DT.Points;
linRGB = XYZ2linRGB(XYZ);
linRGB = 0.5 + 0.5*(linRGB-0.5) ./ max(abs(linRGB - 0.5),[],2);
sRGB = linRGB2sRGB(linRGB);

%     XYZ = get_color_body_boundary_mesh(d_lambda);
%     DT = delaunayTriangulation(XYZ);
%     CL = DT.ConnectivityList;
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
    AO = CS.axis_Lab_order;
    fig = figure();
    hold on;
%         ax = gca;
%         ax.FontSmoothing = 'on';
%         fig.GraphicsSmoothing = 'on';
%         set(gcf, 'renderer', 'zbuffer');
    grid on;
    CC = CS.transform_into(XYZ);
    T = size(CL, 1);
    for i = 1:T
        v = [CC(CL(i, 1), :); CC(CL(i, 2), :); CC(CL(i, 3), :)];
        color = mean(sRGB([CL(i, 1), CL(i, 2), CL(i, 3)], :));
        fill3(v(:, abs(AO(1))), v(:, abs(AO(2))), v(:, abs(AO(3))), color, 'LineStyle', 'none', 'FaceAlpha', 1.0);
    end
%         lighting none;
%         camlight('headlight');
% %         plot3(XYZ_sample(:, 1), XYZ_sample(:, 2), XYZ_sample(:, 3), '.b');
%         s = trisurf(CL,CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),'FaceColor','b','FaceAlpha',0.5);
%         s.EdgeColor = 'none';

    set(gca,'FontSize',15);
    FontSize = 20;
%         pic_name = ['The sRGB gamut projected',newline, 'into ', CS.name,' color space'];
%         title(pic_name);
%         title(CS.name, 'FontSize', FontSize);
    xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
    ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
    zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
    ax = gca;
%         ax.Projection = 'perspective';
    axis tight;
    axis equal;
    switch CS.name
        case {'linRGB', 'sRGB'}
            view(150,-16);
        case 'LMS'
            view(139,-33);
        case 'deviceRGB'
            view(143,-18);
        case 'CIE XYZ'
            view(139,-33);
        case 'CIE xyY'
            view(107,11);
        case 'CIELAB'
            view(105,14);
        case 'proLab'
            view(101,10);
        case 'CAM16-UCS'
            view(102,8);
    end
    if AO(1) < 0
        set(gca,'XDir', 'reverse');
    end
    if AO(2) < 0
        set(gca,'YDir', 'reverse');
    end
    if AO(3) < 0
        set(gca,'ZDir', 'reverse');
    end

%         XYZ = vertex*diag(D65);
%         CC = CS.transform_into(XYZ);
%         plot_cube(CC, [0 0 0]);

    pic_name = ['images/body/', CS.name, '_color_body.png']; 
    saveas(fig, pic_name);
%         RGB = AntiAlias(gcf, 4, 'lanczos3');
%         imwrite(RGB, pic_name);
end

