% computePseudoHessian routine computes the pseudo Hessian matrix using 
% C0inv and F.and returns intermetiary vectors.
%%% ÊäÈë£º
% F matrix of partial derivatives
% C0_inv inverse of variance-covariance matrix
% Ft transpose of F
%%% Êä³ö£º
% M pseudo Hessian

function [M,Ft] = computePseudoHessian_czw(F, C0_inv)

% compute C0invF
C0invF = C0_inv * F;

% transpose F
Ft = F';

% compute M
M = Ft * C0invF;
