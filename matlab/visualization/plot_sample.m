
clc;
clear;
close all;

addpath(genpath('..'));

sample_size = 30000; % 300000
XYZ = get_sample(sample_size);
FontSize = 20;
CS_list = {'LMS'; 'deviceRGB'; 'CIE XYZ'; 'CIE xyY'; 'linRGB'; 'sRGB'; 'CIELAB'; 'CAM16-UCS'; 'proLab'};
% CS_list = {'proLab'};
dist_CIEDE2000 = get_CIEDE2000(XYZ, 'CIE XYZ');
for CS_num = 1:size(CS_list, 1)
    CS_name = CS_list{CS_num};
    handle = color_dist(CS_name);
    dist = handle(XYZ);
    fig = figure();
    hold on;
    set(gca,'FontSize',15);
%         set(gcf, 'Position',  [100, 100, 350, 300]);
%         title('Sample');
    s = scatter(dist_CIEDE2000, dist,'.','MarkerEdgeColor',[0 0 0]);
    s.MarkerEdgeAlpha = 0.02;
    xlabel('$\mathrm{\Delta E^*_{00}}$','Interpreter','latex','FontSize', FontSize);
    ylabel(['$\mathrm{\Delta E_{', CS_name, '}}$'],'Interpreter','latex','FontSize', FontSize);
    saveas(fig,['images/sample/', CS_name, '.png']);
%     saveas(fig,['pic/sample_', CS_name, '.png']);
end
%%

% M = sRGB_matrix^(-1);
% colors{1} = [0 0 0];
% colors{2} = (M(:,1))';
% colors{3} = (M(:,2))';
% colors{4} = (M(:,3))';
% colors{5} = (M(:,2)+M(:,3))';
% colors{6} = (M(:,3)+M(:,1))';
% colors{7} = (M(:,1)+M(:,2))';
% colors{8} = (sum(M,2))';
% n = 8;
% 
% dist_XYZ = zeros(n,n);
% dist_Lab = zeros(n,n);
% dist_proLab = zeros(n,n);
% dist_CIEDE2000 = zeros(n,n);
% % optimal_param = [-45.1686, 362.3583, 35.9817, -59.2676, 106.1844, -70.1276, 1.5045, 0.7608, 0.9413];
% % optimal_param = [1241.9,865.4,669.5,1765,658.6,497.1,4.7,7.1,5.8]
% for i = 1:n
%     for j = 1:n
%         XYZ = {colors{i}, colors{j}};
%         XYZ_dist(i,j) = get_space_distance(@XYZ2XYZ, XYZ, params.XYZ);
%         dist_Lab(i,j) = get_space_distance(@XYZ2Lab, XYZ, params.Lab);
%         dist_proLab(i,j) = get_space_distance(@XYZ2proLab, XYZ, params.proLab);
%         dist_CIEDE2000(i,j) = get_CIEDE2000(XYZ);
%     end
% end
% 
% % sqrt(sum(sum((CIEDE2000 - proLab_dist).^2))/28)
% % sqrt(sum(sum(((proLab_dist - CIEDE2000)./(CIEDE2000+0.01)).^2))/28)
% % proLab_dist
% % (Lab_dist - CIEDE2000)./ CIEDE2000
% dist_proLab
% % CIEDE2000
% % proLab_dist - CIEDE2000
% % Lab_dist - CIEDE2000
% % Lab_dist - proLab_dist
% % XYZ_dist/66.9044


