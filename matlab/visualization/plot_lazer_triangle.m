
function plot_lazer_triangle(CS_name, Y)
    lambda = (400:660)';
    formulary = '1931_FULL';
    XYZ = get_XYZ_spectrum(lambda, formulary);
    XYZ = Y * XYZ ./ XYZ(:, 2);
    CS = color_spaces_collection(CS_name, RECORD);
    CC = CS.transform_into(XYZ);
    AO = CS.axis_Lab_order;
    plot3(CC(:,abs(AO(1))),CC(:,abs(AO(2))),CC(:,abs(AO(3))),'black','LineWidth',2);
    plot3([CC(1,abs(AO(1))),CC(end,abs(AO(1)))], ...
          [CC(1,abs(AO(2))),CC(end,abs(AO(2)))], ...
          [CC(1,abs(AO(3))),CC(end,abs(AO(3)))],'--black','LineWidth',2);
end