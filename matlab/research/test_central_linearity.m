
clc;
clear;
close all;

addpath(genpath('..'));

% CS_list = {'CIEXYZ'; 'CIExyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
CS_list = {'sRGB'; 'CIELAB'};
FontSize = 20;
t = (0:0.001:1)';
linRGB = t * [1.0, 0.5, 0.1];
XYZ = linRGB2XYZ(linRGB);
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
    AO = CS.axis_Lab_order;
    CC = CS.transform_into(XYZ);
    figure();
    hold on;
    grid on;
    set(gca,'FontSize',15);
    title(CS.name);
    plot3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),'.');
    xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
    ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
    zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
end

