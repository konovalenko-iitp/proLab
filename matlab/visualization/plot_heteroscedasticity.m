
clc;
clear;
close all;

addpath(genpath('..'));
    
global_size = 10000; % 100000
%     global_size = 5;
options.check_camera_sane = true;
XYZ_set = get_sample(global_size, options);
XYZ_set = XYZ_set{1};    

%     local_size = 1000;
%     XYZ = simulate_camera_noise(local_size, global_size, XYZ_set);

CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
%     CS_list = {'CIELAB'};
FontSize = 20;
for CS_num = 1:size(CS_list, 1)
    CS = color_spaces_collection(CS_list{CS_num});
%         Sigma_prac = get_sigma(XYZ, CS.name, param);
    Sigma_teor = get_sigma_linearization(XYZ_set, CS.name);
%         Delta = max(max(abs(Sigma_prac-Sigma_teor)))
    Sigma = Sigma_teor;
    Sigma = Sigma(:);
    [STRESS, F] = get_STRESS(Sigma, ones(size(Sigma)));
    Sigma = F * Sigma;
    disp(CS.name);
    disp(['    STRESS = ', num2str(STRESS)]);
    fig = figure;
    hold on;
    grid on;
%         set(gca,'YScale','log')
%         title(CS.name);
    h = histogram(Sigma);
%         h = histogram(Sigma,(0:0.02:2));
%         H = max(h.Values);
    H = 20000;
%         hist(Sigma,100);
%         [n, xout] = hist(Sigma,100);
%         bar(xout, n, 'barwidth', 1, 'basevalue', 1);
%         set(gca,'YScale','log')        
    plot([1 1], [0 H], 'g', 'LineWidth',3);
%         xlim([0, 2]);
%         ylim([0, H]);
    set(gca,'FontSize',15);
%         xlabel('$F\sqrt{\mathbf{e}_{j}(\hat{\Sigma} [\Phi(\mathbf{X}(\mathbf{x}_i))])}$','Interpreter','latex','FontSize', FontSize);
%         ylabel(['$\sigma[',lightness_name(2:end-1),']$'],'Interpreter','latex','FontSize', FontSize);
    saveas(fig,['images/heteroscedasticity/', CS.name, '_hist.png']);
end



