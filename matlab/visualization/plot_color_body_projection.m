
function plot_color_body_projection(CS_name)
%     d_lambda = 0.5;
    d_lambda = 4;
    CS = color_spaces_collection(CS_name, proLab_param);
    AO = CS.axis_Lab_order;
    cache_path = ['search_optimal_proLab_param/cache/color_body_', CS_name, '_projection_',num2str(d_lambda),'.mat'];
    if exist(cache_path, 'file') == 0
        XYZ = get_color_body_boundary_mesh(d_lambda);
        CC = CS.transform_into(XYZ);
        CC(:,CS.axis_Lab_order(1)) = -1;
    %     plot3(CC(:,1),CC(:,2),CC(:,3),'.r','MarkerSize',4);
        idx = sum(isnan(CC),2) == 0;
        CC = CC(idx, :);
        
    %     k = convhull(CC(:, abs(AO(2:3))));
        k = boundary(CC(:, abs(AO(2:3))));
    %     s = trisurf(k,CC(:,1),CC(:,2),CC(:,3),'Facecolor',0.4*[1 1 1],'FaceAlpha',0.3);
    %     s.EdgeColor = 'none';
    %     1
        CC = CC(k, :);
        save(cache_path, 'CC');
    else
        load(cache_path);
    end   
    s = fill3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),0.8*[1 1 1]);
    s.EdgeColor = 'none';
%     plot3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),'.black');
%     plot3(CC(:,1),CC(:,2),CC(:,3),'r','LineWidth',2);
    
%     DT = delaunayTriangulation(CC(:, abs(AO(2:3))));
%     CL = DT.ConnectivityList;
%     T = size(CL, 1);
%     for i = 1:T
%         v = [CC(CL(i, 1), :); CC(CL(i, 2), :); CC(CL(i, 3), :)];
%         color = 0.3*[1 1 1];
%         fill3(v(:, abs(AO(1))), v(:, abs(AO(2))), v(:, abs(AO(3))), color, 'LineStyle', 'none', 'FaceAlpha', 0.6);
%     end
    
end


