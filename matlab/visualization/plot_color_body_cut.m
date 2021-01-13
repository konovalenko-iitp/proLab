
function plot_color_body_cut(CS_name, Y)
    
    d_lambda = 0.5;
    
    cache_path = ['cache/color_body_cut_',num2str(d_lambda),'.mat'];
    if exist(cache_path, 'file') == 0
        
        XYZ = get_color_body_boundary_mesh(d_lambda);
        h = 0.0015;
        idx = abs(XYZ(:, 2)-Y) <= h;
        XYZ(:, 2) = Y;
        XYZ = XYZ(idx, :);
%         figure();
%         hold on;
%         plot3(XYZ(:, 1), XYZ(:, 2), XYZ(:, 3), '.b');
        k = convhull(XYZ(:, [1 3]));
        XYZ = XYZ(k, :);
%         plot3(XYZ(:, 1), XYZ(:, 2), XYZ(:, 3), 'or');
%         xlabel('X');
%         ylabel('Y');
%         zlabel('Z');
%         view(0,0);
%         axis tight;
%         axis equal;
        cut = zeros(0, 3);
        n = size(XYZ, 1);
        for i = 1:n
            cc_1 = XYZ(i, :);
            cc_2 = XYZ(mod(i,n)+1, :);
            l = 1+fix(1000*norm(cc_2-cc_1));
            t = (1:l)'/l;
            CC = cc_1 + t * (cc_2-cc_1);
            cut = [cut; CC];
        end
%         figure();
%         hold on;
%         plot3(XYZ(:, 1), XYZ(:, 2), XYZ(:, 3), '.black');
%         xlabel('X');
%         ylabel('Y');
%         zlabel('Z');
%         view(0,0);
%         axis tight;
%         axis equal;
        save(cache_path, 'cut');
    else
        load(cache_path);
    end     
    CS = color_spaces_collection(CS_name);
    CC = CS.transform_into(cut);
    AO = CS.axis_Lab_order;
%     plot3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),'.r');;
    CC(:,CS.axis_Lab_order(1)) = -0.9;
    s = fill3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),0.5*[1 1 1]);
    s.EdgeColor = 'none';
%     if strcmp(CS_name, 'CIELAB')
%         quasars = [50, -80, 0; 50, 80, 0; 50, 0, -80; 50, 0, 80];
%         quasars
%         plot3(quasars(:,abs(AO(1))),quasars(:,abs(AO(2))),quasars(:,abs(AO(3))),'.black','MarkerSize',20);
%     end
end
    

