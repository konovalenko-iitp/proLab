
function XYZ = get_sample_temp

    M = linRGB_matrix^(-1);
    
    principal_colors{1} = [0 0 0]; % Black
    principal_colors{2} = (M(:,1))'; % Red
    principal_colors{3} = (M(:,2))'; % Green
    principal_colors{4} = (M(:,3))'; % Blue
    principal_colors{5} = (M(:,2)+M(:,3))'; % Yellow
    principal_colors{6} = (M(:,3)+M(:,1))'; % Magenta
    principal_colors{7} = (M(:,1)+M(:,2))'; % Cyan
    principal_colors{8} = (sum(M,2))'; % White
    n = 8;
    XYZ{1} = zeros(0, 3);
    XYZ{2} = zeros(0, 3);
    for i = 1:n
        for j = (i+1):n
            XYZ{1} = [XYZ{1}; principal_colors{i}];
            XYZ{2} = [XYZ{2}; principal_colors{j}];
        end
    end
end

