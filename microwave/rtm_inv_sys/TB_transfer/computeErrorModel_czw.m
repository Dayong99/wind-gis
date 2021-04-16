% 计算正向模型的模型误差时

%%% 输入参数
%%% sig_mod_target model error at target level for [H, V, ST3, ST4] [K]
%%% 
%%% 输出参数
%%% sig_mod_ant model error at antenna level for the polarisation and the geometry of the measurement (2 values for ST3/ST4, one valude of X or Y) [K]

function sig_mod_ant = computeErrorModel_czw(sig_mod_target,faradRot,geomRot)

switch_err_mod='false';
if strcmp(switch_err_mod,'true')
    C_mod_earth=sig_mod_target.^2;
    
    % compute model error covariance matrix at antenne level
    % computeMR4 
    omega=faradRot;
    phi_psi=geomRot;
    a = omega + phi_psi;
    sina = sind(a);
    sqsina = sina * sina;
    sqcosa = 1 - sqsina;
    cosa = cosd(a);
    sin2a = 2 * sina * cosa;
    cos2a = sqcosa - sqsina; 
    MR4 = [sqcosa sqsina -0.5*sin2a 0;
        sqsina sqcosa 0.5*sin2a 0;
        sin2a -sin2a cos2a 0;
        0 0 0 1];
    % compute C_mod_ant
    MR4_trans = MR4';
    C_mod_ant = MR4 * C_mod_earth * MR4_trans;
    C_mod_ant_diag=diag(C_mod_ant);
    
    % select polarisation in C_mod_ant according to polarisation of measurement
    sig_mod_ant = sqrt(C_mod_ant_diag); % H,V,3,4

else
    % switch_err_mod is false, return 0
    sig_mod_ant = [0 0 0 0];
end
    