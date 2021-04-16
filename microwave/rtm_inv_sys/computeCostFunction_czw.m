% computeCostFunction routine computes square of cost function chi
% and returns intermetiary vectors.
%%%  ‰»Î£∫
% X vector (measurement and priors)
% X_mod vector (model estimates and current values of the adjusted parameters)
% C0inv inverse of variance-covariance matrix
%%%  ‰≥ˆ£∫
% chiSquare same as above in double

function chiSquare = computeCostFunction_czw(X, X_mod, C0inv)

XminusX_mod = X - X_mod;
XminusX_modT = XminusX_mod';
C0invXminusX_mod = C0inv * XminusX_mod;

% compute cost function: XminusX_modT * C0invXminusX_mod
chiSquareMat = XminusX_modT * C0invXminusX_mod;

% retrieve square of cost function as a double
chiSquare = chiSquareMat(1,1);