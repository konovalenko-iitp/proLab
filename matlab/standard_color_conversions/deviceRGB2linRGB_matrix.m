
function matrix = deviceRGB2linRGB_matrix
    %% mls-dataset
    M1 = 0.1*(0.3 / (2^16)) * [ ...
         41.93, -2.08,  -37.24; ...
        -14.32, 39.13,   10.79; ...
         -0.02, -35.39, 185.52];
    matrix = M1;
%     matrix = M1^(-1);
%     matrix = (M1')^(-1);
%     matrix = M1';
    
    %% dxomark
    
%     M2 = [2.27, -1.42, 0.15; -0.28, 1.67, -0.39; 0.04, -0.8, 1.75];
%     matrix = M2;
%     matrix = M2^(-1);
%     matrix = (M2')^(-1);
%     matrix = M2';
end
