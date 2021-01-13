
clc;
clear;
close all;

%%

% type = 'gray';
type = 'color';
brightness = 'const';
% brightness = 'max';

%%

addpath(genpath('..'));

CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
% CS_list = {'linRGB'; 'sRGB'};
FontSize = 20;
h = 0.05; % 0.005
[x, y] = meshgrid(h:h:1, h:h:1);
x = reshape(x, [numel(x), 1]);
y = reshape(y, [numel(y), 1]);
L = 50;
XYZ = Lab2XYZ([L 0 0]);
Y = XYZ(2);
xyY = [x, y, Y*ones(size(x))];
XYZ = xyY2XYZ(xyY);
linRGB = XYZ2linRGB(XYZ);
switch brightness
    case 'const'
        Th = 1;
    case 'max'
        Th = +Inf;
end
for i = size(linRGB, 1):-1:1
    if ~(0 <= min(linRGB(i, :)) && max(linRGB(i, :)) <= Th)
        x(i, :) = [];
        y(i, :) = [];
    end
end
DT = delaunayTriangulation([x y]);
CL = DT.ConnectivityList;
xyY = [x, y, Y*ones(size(x))];
XYZ = xyY2XYZ(xyY);
switch type
    case 'gray'
        sRGB = XYZ2sRGB(Lab2XYZ([L 0 0]));
    case 'color'
        sRGB = XYZ2sRGB(XYZ);
end
if strcmp(brightness, 'max')
    sRGB = sRGB ./ max(sRGB,[],2); 
end
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
    AO = CS.axis_Lab_order;
    CC = CS.transform_into(XYZ);
    fig = figure(CS_num);
    hold on;
    grid on;
    set(gca,'FontSize',15);
    T = size(CL, 1);
    for i = 1:T
        v = [CC(CL(i, 1), :); CC(CL(i, 2), :); CC(CL(i, 3), :)];
        switch type
            case 'gray'
                color = sRGB;
            case 'color'
                color = mean(sRGB([CL(i, 1), CL(i, 2), CL(i, 3)], :));
        end
        fill3(v(:, abs(AO(1))), v(:, abs(AO(2))), v(:, abs(AO(3))), color, 'LineStyle', 'none');
    end
    plot_MacAd_Ell(CS.name, Y);
%     plot_lazer_triangle(CS.name, Y);
    plot_color_body_projection(CS.name);
    plot_color_body_cut(CS.name, Y);
%     if strcmp(CS.name, 'CIELAB')
%         noise_verification(L);
%     end
   
%     title(CS.name, 'FontSize', FontSize);
%     title(CS.name, 'Interpreter','latex', 'FontSize', FontSize);
%     title(['MacAdam ellipses (L* = ', num2str(L),')',newline, ...
%         'projected into ', CS.name, ' color space'], ...
%         'Interpreter','latex', 'FontSize', FontSize);
    xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
    ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
    zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
%     ax = gca;
%     ax.Projection = 'perspective';
    view(90,0);
    if AO(1) < 0
        set(gca,'XDir', 'reverse');      
    end
    if AO(2) < 0
        set(gca,'YDir', 'reverse');      
    end
    if AO(3) < 0
        set(gca,'ZDir', 'reverse');      
    end
    axis tight;
    axis equal;
%     xlim([-100, 100]);
%     ylim([-100, 100]);
%     plot3([L, L], [-100, 100], [0, 0], 'black');
%     plot3([L, L], [0, 0], [-100, 100], 'black');
    switch brightness
        case 'const'
            saveas(fig,['images/chromaticity/', CS.name, '_const.png']);
        case 'max'
            saveas(fig,['images/chromaticity/', CS.name, '_max.png']);
    end
end
