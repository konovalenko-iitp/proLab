
clc;
clear;
close all;

addpath(genpath('..'));

%%

% XYZ = get_sample(1000);
% XYZ = XYZ{1,1};
% % CC = XYZ2LMS(XYZ);
% CC = XYZ2deviceRGB(XYZ);
% sum(CC<0)

%%

% % % m = deviceRGB2linRGB_matrix
% % c_v = [2.02; 1; 1.73];
% c_m = [2.27, -1.42, 0.15; -0.28, 1.67, -0.39; 0.04, -0.8, 1.75];
% 
% M = (c_m)^(-1);
% c_m * [1; 1; 1]
% M * [1; 1; 1]
% 
% % % xyY = [0.31271 0.32902 1]; % D65
% % % xyY = [0.34567 0.35850 1]; % D50
% % xyY = [0.44757 0.40745 1]; % A	
% % 
% % XYZ = xyY2XYZ(xyY)
% % linRGB = XYZ2linRGB(XYZ)

%%

% X = randn(10, 3);
% K = X'*X;
% k11 = K(1,1);
% k12 = K(1,2);
% k13 = K(1,3);
% k22 = K(2,2);
% k23 = K(2,3);
% k33 = K(3,3);
% x = randn(1,1);
% 
% N = 10000;
% 
% tic;
% for i = 1:N
%     p = [-1, k11+k22+k33, k12^2 + k13^2 + k23^2 - k11*k22 - k11*k33 - k22*k33, 2*k12*k13*k23 + k11*k22*k33 - k22*k13^2 - k33*k12^2 - k11*k23^2];
%     e = roots(p);
% end
% toc;
% 
% tic;
% for i = 1:N
%     e = eig(K);
% end
% toc;

%%

% P = randn(2,3);
% [X,Y] = meshgrid(-10:0.01:10);
% for i = 1:size(X,1)
%     for j = 1:size(X,2)
%         x = X(i,j);
%         y = Y(i,j);
%         z = P*[x;y;1];
%             z = z ./ z(2);
%         Z(i,j) = z(1);
%     end
% end
% Z(Z>4) = NaN;
% Z(Z<-4) = NaN;
% % Z = min(Z,+4);
% % Z = max(Z,-4);
% mesh(X,Y,Z);
% % surf(X,Y,Z);
% % contour(X,Y,Z);

%%

% N = 1000;
% XYZ = get_sample(N);
% XYZ = XYZ{1,1};
% deviceRGB = XYZ2deviceRGB(XYZ);
% sum(any(deviceRGB<0, 2))

%%

% A = [1 0 0 0; 0 0.5 0.5 0; 0 0 0 1]
% B = A'*(A*A')^(-1)
% B = [1 0 0; 0 1 0; 0 1 0; 0 0 1]
% A*B
% B*A

%%

% % D = [1 0 0 0; 0 0.5 0.5 0; 0 0 0 1]
% M1 = deviceRGB2linRGB_matrix;
% (2^16/0.03)*M1
% M2 = linRGB_matrix^(-1)
% S = (M2 * M1);
% 10^6 * S
% DD = [1 0 0; 0 1 0; 0 1 0; 0 0 1]
% SS = (M2 * M1)^(-1);
% S * SS
% 
% syms a11 a12 a13 a14 a21 a22 a23 a24 a31 a32 a33 a34 real
% S = [a11 a12 a13 a14; a21 a22 a23 a24; a31 a32 a33 a34];
% syms b11 b12 b13 b21 b22 b23 b31 b32 b33 b41 b42 b43 real
% SS = [b11 b12 b13; b21 b22 b23; b31 b32 b33; b41 b42 b43];
% 
% syms x y z g real
% r = [x; y; z];
% diag(r)
% diag(SS * r)
% % S * diag(SS * r)
% % diag(SS * r) * S'
% W = S * diag(SS * r) * S'
% % W(1,1)

%%

syms m1 m2 m3 m4 m5 m6 m7 m8
M = [m1 m2 m3 0; 0 m4 m5 0; 0 0 1 0; m6 m7 m8 1]
det(M)
syms x y z
X = M(1,1) * x + M(1,2) * y + M(1,3) * z + M(1,4);
Y = M(2,1) * x + M(2,2) * y + M(2,3) * z + M(2,4);
Z = M(3,1) * x + M(3,2) * y + M(3,3) * z + M(3,4);
W = M(4,1) * x + M(4,2) * y + M(4,3) * z + M(4,4);

XX = X / W;
YY = Y / W;
ZZ = Z / W;

J = [diff(XX,x) diff(XX,y) diff(XX,z); ...
 diff(YY,x) diff(YY,y) diff(YY,z); ...
 diff(ZZ,x) diff(ZZ,y) diff(ZZ,z)];
det(J)

%%

% M = randn(4,4);
% M(1:3, 4) = 0;
% M(2,1) = 0;
% M(3,1:3) = [0 0 1];
% M(4,1:3) = abs(M(4,1:3));
% M(4,4) = 1;
% m = [M(1,1) M(1,2) M(1,3) M(2,2) M(2,3) M(4,1) M(4,2) M(4,3)];
% % m
% % regularization(m)
% % M
% param.m = m;
% penalty(param);



