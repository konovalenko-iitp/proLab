
clc;
clear;
close all;

addpath(genpath('..'));

FontSize = 20;

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

% GAIN_by_noise = [];
MS = zeros(0, 4);
CS = zeros(0, 4);

for scene_number = 1:1
    
    lim_idx.I = 401:900;
    lim_idx.J = 251:950;

    scene_name = num2str(scene_number);
    if size(scene_name,2) < 2
        scene_name = ['0', scene_name];
    end
   
    for sources_number = 2:2
%     for sources_number = 10:10

        sources_name = sources_list{sources_number};
                
        folder = 'images_16bit_raw';

        path = [data_path, '\', folder, '\', scene_name, '\', scene_name '_', sources_name, '.png'];
        pic_1C = imread(path);
        pic_4C = zeros(size(pic_1C,1)/2,size(pic_1C,2)/2,4,'uint16');
        for i = 1:size(pic_1C,1)/2
            for j = 1:size(pic_1C,2)/2
                Bayer_pixel = pic_1C(2*i-1:2*i, 2*j-1:2*j);
                pic_4C(i,j,1) = Bayer_pixel(1,1);
                pic_4C(i,j,2) = Bayer_pixel(1,2);
                pic_4C(i,j,3) = Bayer_pixel(2,1);
                pic_4C(i,j,4) = Bayer_pixel(2,2);
            end 
        end
        
        folder = 'masks_16bit_color';
        path = [data_path, '\', folder, '\', scene_name, '.png'];
        mask = imread(path);
        mask_lim = mask(lim_idx.I, lim_idx.J, :);
        figure();
        imshow(mask_lim);
        imwrite(mask_lim, 'images/mask_lim.png');
        
        path = [data_path, '\reverse_engineering_sRGB.png'];
        true_sRGB = imread(path);
        true_sRGB = double(true_sRGB) / 255;
        true_sRGB_lim = true_sRGB(lim_idx.I, lim_idx.J, :);
        figure();
        imshow(true_sRGB_lim);
        imwrite(true_sRGB_lim, 'images/true_sRGB_lim.png');
        
        mv = [ ...
            225 252 103; ...
            62 161 65; ...
            99 51 159; ...
            201 154 102; ...
            62 1 126; ...
            237 28 36; ...
            251 50 175; ...
            242 251 227; ...
            118 90 46; ...
            107 150 143; ...
            205 186 171; ...
            84 248 27; ...
            115 81 255; ...
            151 234 220; ...
            198 155 180; ...
            103 198 105; ...
            49 88 163; ...
            5 23 88];
        
        color = zeros(size(mv));
%         bin = true_sRGB / 3;
        bin = true_sRGB;
%         bin = zeros(size(true_sRGB));
%         for i = 1:size(bin, 1)
%             for j = 1:size(bin, 2)
%                 bin(i, j, :) = mean(true_sRGB(i, j, :));
%             end
%         end
        CC = reshape(pic_4C, [size(pic_4C,1)*size(pic_4C,2), 4]);
        ii = (1:size(mask,1))' * ones(1,size(mask,2));
        jj = ones(1,size(mask,1))' * (1:size(mask,2));
        for cl = 1:size(mv, 1)
%         for cl = 1
            idx = (mask(:,:,1) == mv(cl, 1)) & (mask(:,:,2) == mv(cl, 2)) & (mask(:,:,3) == mv(cl, 3));
            se = strel('disk',5,0);
            idx = imerode(idx,se);
            center = fix([sum(sum(ii.*idx))/sum(sum(idx)), sum(sum(jj.*idx))/sum(sum(idx))]);
            idx = zeros(size(idx));
            l = 10;
            idx((-l:l)+center(1), (-l:l)+center(2)) = 1;
            idx_frame = zeros(size(idx));
            idx_frame([-l+(-1:+1), l+(-1:+1)]+center(1), (-l:l)+center(2)) = 1;
            idx_frame((-l:l)+center(1), [-l+(-1:+1), l+(-1:+1)]+center(2)) = 1;
            
            count = 0;
            for i = 1:size(bin,1)
                for j = 1:size(bin,2)
                    if idx(i,j)
                        count = count + 1;
                        color(cl, :) = color(cl, :) + squeeze(true_sRGB(i,j,:))';
                    end
                end
            end
            color(cl, :) = color(cl, :) / count;
            for i = 1:size(bin,1)
                for j = 1:size(bin,2)
                    if idx_frame(i,j)
%                         bin(i,j,:) = color(cl, :);
%                         bin(i,j,:) = pic_4C(i,j,[1 2 4]);
%                         bin(i,j,:) = true_sRGB(i,j,:)/2;
                        bin(i,j,:) = [1, 0, 1];
                    end
                end
            end
            idx_v = reshape(idx, [size(idx,1)*size(idx,2), 1]);
            cc = double(CC);
            cc(~idx_v, :) = [];
            
%             m = mean(cc)
%             m = hwRGB2XYZ(m);
%             m = m / m(2)
            
%             gain_by_discret = estim_gain_by_discret(cc);
            [gain_by_noise, mS, cS] = estim_gain_by_noise(cc);
            MS = [MS; mS];
            CS = [CS; cS];
%             GAIN_by_noise = [GAIN_by_noise; gain_by_noise];
              
%             c = double(cc(:,4));
%             figure();
%             hold on;
%             set(gca,'FontSize',15);
%             title('Sensor data histogram');
%             xlabel('$\mathbf{B}$','Interpreter','latex','FontSize', FontSize);
%             ylabel('$\#$','Interpreter','latex','FontSize', FontSize);
%             hist(c, 1000);
            
            figure(51);
            hold on;
            grid on;
            plot3(cc(:,1),cc(:,2),cc(:,4),'.','MarkerSize',7,'MarkerEdgeColor', color(cl, :));
            view(0,0);
            xlabel('$\mathbf{R}$','Interpreter','latex','FontSize', FontSize);
            ylabel('$\mathbf{G}$','Interpreter','latex','FontSize', FontSize);
            zlabel('$\mathbf{B}$','Interpreter','latex','FontSize', FontSize);
%             xticks(0:100:10000);
%             yticks(0:100:10000);
%             zticks(0:100:10000);
            axis tight;
            axis equal;
%             xlim([0 3500]);
%             zlim([0 2500]);
        end
        bin_lim = bin(lim_idx.I, lim_idx.J, :);
        figure();
        imshow(bin_lim);
        imwrite(bin_lim, 'images/bin_lim.png');
        
        
%         bin = bin(500:end-300, 300:end-600, :);
%         bin = bin ./ max(max(bin));
%         figure();
%         imshow(bin);
%         miB = min(min(bin));
%         maB = max(max(bin));
%         bin = (bin - miB) ./ (maB - miB);
%         figure();
%         imshow(bin);

        disp([scene_number, sources_number]);
    end
end

X = MS(:);
Y = CS(:);
mX = mean(X);
mY = mean(Y);
X = X - mX;
Y = Y - mY;
K = [X'; Y'] * [X, Y];
[U, S, V] = svd(K);
k = U(2,1) / U(1,1);
b = mY - mX * k;
% F = [X, ones(size(X))];
% b = (F' * F)^(-1) * F' * Y
% sqrt(b(2))
x = [0; 6000];
y = b + x * k;
[k, b]


figure();
hold on;
grid on;
set(gca,'FontSize',15);
plot(MS(:,1), CS(:,1), '.r', 'MarkerSize', 15);
plot(MS(:,2), CS(:,2), '.g', 'MarkerSize', 15);
plot(MS(:,3), CS(:,3), '.g', 'MarkerSize', 15);
plot(MS(:,4), CS(:,4), '.b', 'MarkerSize', 15);
plot(x, y, '-black');
% xticks(0:2000:100000);
% yticks(0:2000:100000);
% xlabel('$\overline{S}$','Interpreter','latex','FontSize', FontSize);
% ylabel('$\overline{(S-\overline{S})^2}$','Interpreter','latex','FontSize', FontSize);
xlabel('$\mathbb{E}$','Interpreter','latex','FontSize', FontSize);
ylabel('$\overline{(S-\overline{S})^2}$','Interpreter','latex','FontSize', FontSize);





