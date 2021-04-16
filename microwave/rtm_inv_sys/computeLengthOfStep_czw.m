% computeLengthOfStep routine computes the length of the step of the iteration.
% and returns intermetiary vectors.
%%% 输入：
% M pseudo Hessian
% C0inv inverse of variance-covariance matrix
% Ft transpose of F
% X vector (measurement and priors)
% X_mod vector (model estimates and current values of the adjusted parameters)
% lamdaDia
%%% 输出：
% dp length of step


function dp = computeLengthOfStep_czw(M, C0inv, Ft, X, X_mod, lamdaDia)

% copy pseudo Hessian and set non diagonal terms to zero
m1 = size(M,1);
m2 = size(M,2);
DM=zeros(m1,m2);
if m1 == m2
  for i=1:m1
      DM(i,i) = M(i,i);
  end
else
    disp('Dimensions of matrix M are different ');
    return;
end

% multiply diagonal terms of DM by lamdaDia
for inc=1:m1
    DM(inc,inc) = DM(inc,inc) * lamdaDia;
end

% compute modified pseudo Hessian matrix Mm
Mm = M + DM;

% % compute inverse of Mm
% Mm_inv = inv(Mm);

% compute FtC0invXminusX_mod
XminusX_mod = X - X_mod;
C0invXminusX_mod = C0inv * XminusX_mod;
FtC0invXminusX_mod = Ft * C0invXminusX_mod;

% % compute lentgh of step dp
% dp = Mm_inv * FtC0invXminusX_mod;

% Replace inv(A)*b with A\b INV影响速度
dp = Mm \ FtC0invXminusX_mod;




