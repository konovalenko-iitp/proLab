
clc;
clear;
close all;

addpath(genpath('..'));

%%

data_path = 'C:\Users\alatkon\Desktop\D\proLab\mls-dataset';
% data_path = 'C:\Users\Ivan Konovalenko\Desktop\D\proLab\mls-dataset';

sources_list = { ...
    '2HAL'
    '2HAL_DESK'
    '2HAL_DESK_LED-B025'
    '2HAL_DESK_LED-B050'
    '2HAL_DESK_LED-B075'
    '2HAL_DESK_LED-B100'
    '2HAL_DESK_LED-BG025'
    '2HAL_DESK_LED-BG050'
    '2HAL_DESK_LED-BG075'
    '2HAL_DESK_LED-BG100'
    '2HAL_DESK_LED-R025'
    '2HAL_DESK_LED-R050'
    '2HAL_DESK_LED-R075'
    '2HAL_DESK_LED-R100'
    '2HAL_DESK_LED-RG025'
    '2HAL_DESK_LED-RG050'
    '2HAL_DESK_LED-RG075'
    '2HAL_DESK_LED-RG100'
    };

sources_list_bug = { ...
    '2HAL'
    '2HAL_DESK'
    '2HAL_DESK_LED-B025'
    '2HAL_DESK_LED-B050'
    '2HAL_DESK_LED-B075'
    '2HAL_DESK_LED-B100'
    '2HAL_DESK_LED-BG025'
    '2HAL_DESK_LED-BG050'
    '2HAL_DESK_LED-BG075'
    '2HAL_DESK_LED-BG100'
    '2HAL_DESK_R025'
    '2HAL_DESK_R050'
    '2HAL_DESK_R075'
    '2HAL_DESK_R100'
    '2HAL_DESK_RG025'
    '2HAL_DESK_RG050'
    '2HAL_DESK_RG075'
    '2HAL_DESK_RG100'
    };

for scene_number = 1:1

    scene_name = num2str(scene_number);
    if size(scene_name,2) < 2
        scene_name = ['0', scene_name];
    end
    
%     for sources_number = [1,2,6,10,14,18]
    for sources_number = 2:2

        sources_name = sources_list{sources_number};

%         folder = 'images_16bit_raw';
%         folder = 'images_16bit_color';
%         folder = 'images_preview';
%         folder = 'masks_16bit_raw';
%         folder = 'masks_16bit_color';
%         folder = 'masks_preview';

%         path = [data_path, '\', folder, '\', scene_name, '\', scene_name '_', sources_name, '.png'];
%         pic = imread(path);
%         I = zeros(size(pic,1)/2,size(pic,2)/2,3,'uint16');
%         for i = 1:size(pic,1)/2
%             for j = 1:size(pic,2)/2
%                 Bayer_pixel = pic(2*i-1:2*i, 2*j-1:2*j);
%                 I(i,j,1) = Bayer_pixel(1,1);
%                 I(i,j,2) = (Bayer_pixel(1,2)+Bayer_pixel(2,1))/2;
%                 I(i,j,3) = Bayer_pixel(2,2);
%             end 
%         end
%         figure(2*sources_number-1);
%         imshow(I);

        folder = 'images_16bit_color';
        path = [data_path, '\', folder, '\', scene_name, '\', scene_name '_', sources_name, '.png'];
        pic = imread(path);
        figure();
        imshow(pic);

        J = zeros(size(pic,1),size(pic,2),3);
        for i = 1:size(pic,1)
            deviceRGB = double(squeeze(pic(i,:,:)));
            XYZ = deviceRGB2XYZ(deviceRGB);
%             linRGB = XYZ2linRGB(XYZ);
%             J(i,:,:) = linRGB;
            sRGB = XYZ2sRGB(XYZ);
            J(i,:,:) = sRGB;
        end
%         min(min(J))
%         max(max(J))
%         J(1:100, 1:100, :) = 1;
%         J = J / max(max(max(J)));
        figure();
        hold on;
        title(sources_name);
        imshow(J);
        imwrite(J, [data_path, '\reverse_engineering_sRGB.png']);
%         imwrite(J, [data_path, '\reverse_engineering_linRGB.png']);
        
        folder = 'images_preview';
        sources_name_bug = sources_list_bug{sources_number};
        path = [data_path, '\', folder, '\', scene_name, '\', scene_name '_', sources_name_bug, '.jpg'];
        preview = double(imread(path));
        preview = preview / max(max(max(preview)));
        figure();
        hold on;
        title(sources_name);
        imshow(preview);

        disp([scene_number, sources_number]);
    end
end
 


