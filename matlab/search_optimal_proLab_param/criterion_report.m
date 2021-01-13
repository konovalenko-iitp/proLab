
function criterion_report(CDB, criter_name, param)
    disp(['Criterion : ', criter_name]);
    CD_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
%     CD_list = {'proLab'};
    for CD_num = 1:size(CD_list, 1)
        CD_name = CD_list{CD_num};
        crit_val = CDB.get(CD_name, param, criter_name);
        n = size(CD_name, 2);
        for j = 10:-1:n
            CD_name = [CD_name, ' '];
        end
        CD_name = ['    ', CD_name];
        disp([CD_name, ': ', num2str(crit_val)]);
    end
end

