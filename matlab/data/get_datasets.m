
% clc;
% clear;
% close all;

function [XYZ, ECD] = get_datasets
    % 
    % ECD - experimantal color differences
    %
    
    XYZ = cell(1,2);
    XYZ{1} = zeros(0, 3);
    XYZ{2} = zeros(0, 3);
    ECD = zeros(0, 1);
    
    %% rit-dupont: alman1989

    path = 'color-data-master\rit-dupont\alman1989';
    data = load(path);
    data = data.data;
    n = size(data, 1);
    Lab = cell(1, 2);
    Lab{1} = zeros(n, 3);
    Lab{2} = zeros(n, 3);
    ECD_part = zeros(n, 1);
    for i = 1:n
        Lab{1}(i, :) = [data{i,1}, data{i,2}, data{i,3}];
        Lab{2}(i, :) = Lab{1}(i, :) + [data{i,4}, data{i,5}, data{i,6}];
        ECD_part(i, 1) = data{i,8};
    end
    XYZ_part = Lab2XYZ(Lab);
    for j = 1:2
        XYZ{j} = [XYZ{j}; XYZ_part{j}];
    end
    ECD = [ECD; ECD_part];

    %% rit-dupont: berns

    path = 'color-data-master\rit-dupont\berns';
    data = load(path);
    data = data.data;
    n = size(data, 1);
    Lab = cell(1, 2);
    Lab{1} = zeros(n, 3);
    Lab{2} = zeros(n, 3);
    ECD_part = zeros(n, 1);
    for i = 1:n
        Lab{1}(i, :) = [data{i,8}, data{i,9}, data{i,10}];
        Lab{2}(i, :) = Lab{1}(i, :) + [data{i,11}, data{i,12}, data{i,13}];
        ECD_part(i, 1) = data{i,3};
    end
    XYZ_part = Lab2XYZ(Lab);
    for j = 1:2
        XYZ{j} = [XYZ{j}; XYZ_part{j}];
    end
    ECD = [ECD; ECD_part];

    %% witt 

%     path = 'color-data-master\witt\table_a1';
%     data = load(path);
%     data = data.data;
%     n = size(data, 1);
%     C = 5;
%     xyY_raw = cell(1, C);
%     for c = 1:C
%         xyY_raw{c} = zeros(n, 3);
%         for i = 1:n
%             xyY_raw{c}(i,  :) = [data{i,1+3*(c-1)}, data{i,2+3*(c-1)}, data{i,3+3*(c-1)}];
%         end
%     end
%     path = 'color-data-master\witt\table_a2';
%     data = load(path);
%     data = data.data;
%     n = size(data, 1);
%     xyY_C = cell(1,C);
%     ECD_C = cell(1,C);
%     for c = 1:C
%         xyY_C{c} = cell(1, 2);
%         for j = 1:2
%             xyY_C{c}{j} = zeros(n, 3);
%         end
%         ECD_C{c} = zeros(n, 1);
%         for i = 1:n
%             n1 = 1 + data{i,1};
%             n2 = 1 + data{i,2};
%             xyY_C{c}{1}(i, :) = xyY_raw{c}(n1,:);
%             xyY_C{c}{2}(i, :) = xyY_raw{c}(n2,:);
%             ECD_C{c}(i, 1) = data{i,1+2*c};
%         end
%     end
%     xyY = cell(1, 2);
%     xyY{1} = zeros(n*C, 3);
%     xyY{2} = zeros(n*C, 3);
%     ECD_part = zeros(n*C, 1);
%     for c = 1:C
%         idx = (1:n)+n*(c-1);
%         for j = 1:2
%             xyY{j}(idx, :) = xyY_C{c}{j};
%         end
%         ECD_part(idx) = ECD_C{c};
%     end
%     for j = 1:2
%         xyY{j}(:, 3) = xyY{j}(:, 3)/100;
%     end
% %     XYZ_part = xyY2XYZ(xyY);
%     XYZ_part = xyY;
%     for j = 1:2
%         XYZ{j} = [XYZ{j}; XYZ_part{j}];
%     end
%     ECD = [ECD; ECD_part];

    %%
    
    idx = isnan(ECD);
    for j = 1:2
        XYZ{j}(idx, :) = [];
    end
    ECD(idx, :) = [];

%     [(1:size(XYZ{1},1))', XYZ{1}, XYZ{2}, ECD]
        
end


