
function CS = color_spaces_collection(name, param)
    if nargin == 1
        param = proLab_param;
    end
    switch name
        case 'LMS'
            CS.name = 'LMS';
            CS.axis_names = {'$L$', '$M$', '$S$'};
            CS.axis_Lab_order = [2 1 -3];
            CS.transform_into = @(XYZ)XYZ2LMS(XYZ);
            CS.transform_from = @(CC)LMS2XYZ(CC);
        case 'deviceRGB'
            CS.name = 'deviceRGB';
            CS.axis_names = {'$R$', '$G$', '$B$'};
            CS.axis_Lab_order = [2 1 -3];
            CS.transform_into = @(XYZ)XYZ2deviceRGB(XYZ);
            CS.transform_from = @(CC)deviceRGB2XYZ(CC);
        case 'CIE XYZ'
            CS.name = 'CIE XYZ';
            CS.axis_names = {'$X$', '$Y$', '$Z$'};
            CS.axis_Lab_order = [2 1 -3]; % (L,a,b) -> (Y,X,-Z)
            CS.transform_into = @(XYZ)XYZ2XYZ(XYZ);
            CS.transform_from = @(CC)XYZ2XYZ(CC);
        case 'CIE xyY'
            CS.name = 'CIE xyY';
            CS.axis_names = {'$x$', '$y$', '$Y$'};
            CS.axis_Lab_order = [3 1 2]; % (L,a,b) -> (Y,x,y)
            CS.transform_into = @(XYZ)XYZ2xyY(XYZ);
            CS.transform_from = @(CC)xyY2XYZ(CC);
        case 'linRGB'
            CS.name = 'linRGB';
            CS.axis_names = {'$R$', '$G$', '$B$'};
            CS.axis_Lab_order = [2 1 -3]; % (L,a,b) -> (G,R,-B)
            CS.transform_into = @(XYZ)XYZ2linRGB(XYZ);
            CS.transform_from = @(CC)linRGB2XYZ(CC);
        case 'sRGB'
            CS.name = 'sRGB';
            CS.axis_names = {'$R$', '$G$', '$B$'};
            CS.axis_Lab_order = [2 1 -3]; % (L,a,b) -> (G,R,-B)
            CS.transform_into = @(XYZ)XYZ2sRGB(XYZ);
            CS.transform_from = @(CC)sRGB2XYZ(CC);
        case 'CIELAB'
            CS.name = 'CIELAB';
            CS.axis_names = {'$L^*$', '$a^*$', '$b^*$'};
            CS.axis_Lab_order = [1 2 3];
            CS.transform_into = @(XYZ)XYZ2Lab(XYZ);
            CS.transform_from = @(CC)Lab2XYZ(CC);
        case 'proLab'
            CS.name = 'proLab';
            CS.axis_names = {'$L^+$', '$a^+$', '$b^+$'};
            CS.axis_Lab_order = [1 2 3];
            CS.transform_into = @(XYZ)XYZ2proLab(XYZ, param);
            CS.transform_from = @(CC)proLab2XYZ(CC, param);
        case 'CAM16-UCS'
            CS.name = 'CAM16-UCS';
            CS.axis_names = {'$J''$', '$a''$', '$b''$'};
            CS.axis_Lab_order = [1 2 3];
            CS.transform_into = @(XYZ)XYZ2CAM16UCS(XYZ);
    end
end

