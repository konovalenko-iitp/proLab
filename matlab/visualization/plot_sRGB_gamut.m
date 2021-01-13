
function plot_sRGB_gamut(param)

    addpath(genpath(pwd));
    
    if nargin == 0
        param = proLab_param;
        proLabOnly = false;
    else
        proLabOnly = true;
    end
    
    addpath(genpath('..'));
    
    if proLabOnly
        CS_list = {'proLab'};
    else
        CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
    end
    TX = (0:0.05:1)';
    T0 = zeros(size(TX));
    T1 = ones(size(TX));
    linRGB_mesh = [T0, T0, TX; T0, T1, TX; T1, T0, TX; T1, T1, TX; ...
                   T0, TX, T0; T0, TX, T1; T1, TX, T0; T1, TX, T1; ...
                   TX, T0, T0; TX, T1, T0; TX, T0, T1; TX, T1, T1];

    XYZ_linRGB_mesh = (linRGB_matrix^(-1)*linRGB_mesh')';
    %     XYZ_linRGB_vertex = (sRGB_matrix^(-1) * vertex')';

    % CS_list = {'CIEXYZ';};
    h = 0.1; % 0.05
    [A, B] = meshgrid(0:h:1, 0:h:1);
    A = reshape(A, [numel(A), 1]);
    B = reshape(B, [numel(B), 1]);
    DT = delaunayTriangulation([A B]);
    CL = DT.ConnectivityList;
    for CS_num = 1:size(CS_list, 1)
        CS = color_spaces_collection(CS_list{CS_num}, param);
        AO = CS.axis_Lab_order;

        CS_linRGB_mesh = CS.transform_into(XYZ_linRGB_mesh);
    %         CS_linRGB_vertex = CS.transform_into(XYZ_linRGB_vertex);
        fig = figure();
        hold on;
    %         ax = gca;
    %         ax.FontSmoothing = 'on';
    %         fig.GraphicsSmoothing = 'on';
    %         set(gcf, 'renderer', 'zbuffer');
        grid on;
        for ax = 1:3
            for c = 0:1
                C = c*ones(size(A));
                switch ax
                    case 1
                        linRGB = [A, B, C];
                    case 2
                        linRGB = [B, C, A];
                    case 3
                        linRGB = [C, A, B];
                end
                sRGB = linRGB2sRGB(linRGB);
                XYZ = linRGB2XYZ(linRGB);
    %                 min(XYZ)
    %                 max(XYZ)
                CC = CS.transform_into(XYZ);
                T = size(CL, 1);
                for i = 1:T
                    v = [CC(CL(i, 1), :); CC(CL(i, 2), :); CC(CL(i, 3), :)];
                    color = mean(sRGB([CL(i, 1), CL(i, 2), CL(i, 3)], :));
    %                     fill3(v(:, abs(AO(1))), v(:, abs(AO(2))), v(:, abs(AO(3))), color, 'LineStyle', 'none');
                    fill3(v(:, abs(AO(1))), v(:, abs(AO(2))), v(:, abs(AO(3))), color, 'LineStyle', 'none', 'FaceAlpha', 0.6);
                end
            end
        end      
        plot3(CS_linRGB_mesh(:, abs(AO(1))), ...
              CS_linRGB_mesh(:, abs(AO(2))), ...
              CS_linRGB_mesh(:, abs(AO(3))), ...
              '.', 'color',0.5*[1 1 1], 'MarkerSize', 13);
        set(gca,'FontSize',15);
        FontSize = 20;
    %         pic_name = ['The sRGB gamut projected',newline, 'into ', CS.name,' color space'];
    %         title(pic_name);
    %         title(CS.name, 'FontSize', FontSize);
        xlabel(CS.axis_names{abs(AO(1))},'Interpreter','latex','FontSize', FontSize);
        ylabel(CS.axis_names{abs(AO(2))},'Interpreter','latex','FontSize', FontSize);
        zlabel(CS.axis_names{abs(AO(3))},'Interpreter','latex','FontSize', FontSize);
        ax = gca;
        ax.Projection = 'perspective';
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
        if ~proLabOnly
            pic_name = ['images/body/', CS.name, '_sRGB_gamut.png']; 
            saveas(fig, pic_name);
        end
    %         RGB = AntiAlias(gcf, 4, 'lanczos3');
    %         imwrite(RGB, pic_name);
    end
end



