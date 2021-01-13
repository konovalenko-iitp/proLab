
clc;
clear;
close all;

addpath(genpath('..'));

local_size = 100; % 1000
global_size = 200; % 2000

XYZ = simulate_camera_noise(local_size, global_size);
XYZ = reshape(XYZ, [local_size * global_size, 3]);
% min(XYZ)
% max(XYZ)
sRGB = XYZ2sRGB(XYZ);
sRGB = reshape(sRGB, [global_size, local_size, 3]);
CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
%     CS_list = {'proLab'};
FontSize = 20;
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
    AO = CS.axis_Lab_order;
    CC = CS.transform_into(XYZ);
%     size(CC)
%     CS.name
%     sum(CC<0)
    CC = reshape(CC, [global_size, local_size, 3]);
    sides = {'white'; 'black'};
%     sides = {'white'};
    for s = 1:size(sides, 1)
        side = sides{s, 1};
        fig = figure();
        grid on;
        hold on;
        for g = 1:global_size
%             color = rand(1, 3);
            color = mean(sRGB(g,:,:),2);
            if all(0 <= color) && all(color <= 1)
                plot3(CC(g,:,abs(AO(1))),CC(g,:,abs(AO(2))),CC(g,:,abs(AO(3))),'.','MarkerSize', 7, 'color', color);
            end
        end
%         title(CS.name);
        xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
        ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
        zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
        set(gca,'FontSize',15);
        switch side
            case 'white'
                view(+90,0);
            case 'black'
                view(-90,0);
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
        axis tight;
        axis equal;
    %     saveas(fig,['pic/noise_white_', CS.name, '.png']);
        saveas(fig,['images/heteroscedasticity/', CS.name, '_', side, '.png']);
    end
end
