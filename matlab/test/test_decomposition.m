
clc;
clear;

addpath(genpath('..'));

P = rand_P();
U = rand_U();

x = randn(4, 1);
y = randn(4, 1);

for i = 1:10
    T = rand_T();
    R = rand_R();
%     T = eye(4);
%     R = eye(4);
    M = R*T*U*P;
    xx = M*x;
    yy = M*y;
    xx = xx / (xx(4));
    yy = yy / (yy(4));
%     xx = xx(1:3);
%     yy = yy(1:3);
    disp(norm(xx-yy))
end

function T = rand_T()
    T = eye(4);
    T(1:3, 4) = randn(3, 1);
end

function P = rand_P()
    P = eye(4);
    P(4, 1:3) = randn(1, 3);
end

function U = rand_U()
    U = eye(4);
    U(1:3, 1:3) = randn(3, 3);
    U(3, 1:2) = 0;
    U(2, 1) = 0;
end

function R = rand_R()
    a = 2*pi*rand(1,1);
    R_x = [ 1 0 0; 0 cos(a) -sin(a);0 sin(a) cos(a)];
    a = 2*pi*rand(1,1);
    R_y = [cos(a) 0 -sin(a); 0 1 0; sin(a) 0 cos(a)];
    a = 2*pi*rand(1,1);
    R_z = [cos(a) -sin(a) 0; sin(a) cos(a) 0; 0 0 1];
    R = R_x * R_y * R_z;
%     R'*R-eye(3)
%     R*R'-eye(3)
    R = [R [0; 0; 0;]; [0 0 0 1]];
end










