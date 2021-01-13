
clc;
clear;
close all;

addpath(genpath('..'));

h = 0.1;
X = cell(0,0);
for t = 0:h:1
    X{end+1, 1} = [-1, t; 1, t];
end
for t = 0:h:1
    X{end+1, 1} = [t, -1; t, 1];
end

H = [2 0 0;
     0 2 0;
     1 1 1];

figure(1);
hold on;
set(gca,'FontSize',15);
FontSize = 20;

% for i = 1:size(X, 1)
%     plot(X{i}(:, 1), X{i}(:, 2), 'color', 0.7*[1 1 1]);
% end

for i = 1:size(X, 1)
    for j = 1:2
        r = H * [X{i}(j, :)'; 1];
        X{i}(j, :) = r(1:2)' / r(3);
    end
end

for i = 1:size(X, 1)
    plot(X{i}(:, 1), X{i}(:, 2), 'black');
end
axis equal;
xlim([0 1]);
ylim([0 1]);

w = 2/3;
plot([0 w], [0 w], '--black');
text(w+0.01,w+0.03,'$W$','Interpreter','latex','FontSize',FontSize);

t = 0:h:1;
v = H * [t; 0*t; 1+0*t];
v = v(1, :) ./ v(3, :);

tt = cell(size(t));
for i = 1:size(t, 2)
    tt{i} = num2str(t(i));
%     if size(tt{i}, 2) == 3
%         tt{i} = tt{i}(2:end);
%     end
end

set(gca,'xTick',v);
set(gca,'xTickLabels', tt);
set(gca,'XTickLabelRotation',90);
set(gca,'yTick',v);
set(gca,'yTickLabels', tt);

xlabel('$X$','Interpreter','latex','FontSize', FontSize);
ylabel('$Z$','Interpreter','latex','FontSize', FontSize);
